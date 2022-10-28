package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampSite;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.service.CampServie;

@Controller
public class CampAdminController {

    @Autowired
    private CampServie cService;

    // 캠핑리스트 관리 페이지
    @RequestMapping(value = "/campAdmin/campAdminMain.kh", method = RequestMethod.GET)
    public ModelAndView campAdmin(
            @RequestParam(value = "page", required = false) Integer page,
            @ModelAttribute SearchList sList,
            ModelAndView mv) {
        try {
            System.out.println(page);
            if (page != null) {
                sList.setPage(page);
            }
            List<Camp> cList = cService.printCampList(sList);
            int result = cService.printListCount(sList);

            int currentPage = sList.getPage() + 1;
            int totalCount = result;
            int pageLimit = 10;
            int naviLimit = 5;
            int maxPage;
            int startNavi;
            int endNavi;
            maxPage = (int) ((double) totalCount / pageLimit + 0.9);
            startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
            endNavi = startNavi + naviLimit - 1;
            if (maxPage < endNavi) {
                endNavi = maxPage;
            }

            mv.addObject("startNavi", startNavi);
            mv.addObject("endNavi", endNavi);
            mv.addObject("maxPage", maxPage);
            mv.addObject("currentPage", currentPage);
            mv.addObject("totalCount", totalCount);
            mv.addObject("sList", sList);
            mv.addObject("count", result);
            mv.addObject("cList", cList);
            mv.setViewName("admin/campMain");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "리스트 조회 실패").setViewName("common/errorPage");
        }
        return mv;

    }

    // 캠핑장 사이트 출력
    @RequestMapping(value = "/campAdmin/campAdminSite.kh", method = RequestMethod.GET)
    public ModelAndView campAdminSite(
            @RequestParam(value = "contentId", required = false) int contentId,
            ModelAndView mv) {
        try {
            // 세션에 있는 아이디가 어드민이 아니라면 접근하지 못하도록 작동시켜야함

            Camp camp = cService.printCampDetail(contentId);
            List<CampSite> stList = cService.printSiteList(contentId);
            int result = cService.printSiteListCount(contentId);
            // 사이트수가 0이 라면 예약가능 N로 수정 db오류시 자동 수정
            if (result == 0) {
                int confirm = 0;
                int update = cService.campRegistAviModify(contentId, confirm);
            }

            mv.addObject("stList", stList);
            mv.addObject("camp", camp);
            mv.setViewName("admin/campSiteList");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "리스트 조회 실패").setViewName("common/errorPage");
        }
        return mv;
    }

    // 캠핑장 사이트 등록창 출력
    @RequestMapping(value = "/campAdmin/campAdminSiteRegist.kh", method = RequestMethod.GET)
    public ModelAndView campAdminSiteRegist(
            @RequestParam(value = "contentId", required = false) int contentId,
            ModelAndView mv) {
        try {
            // 세션에 있는 아이디가 어드민이 아니라면 접근하지 못하도록 작동시켜야함
            Camp camp = cService.printCampDetail(contentId);

            mv.addObject("camp", camp);
            mv.setViewName("admin/campSiteRegist");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "사이트 등록창 출력 실패").setViewName("common/errorPage");
        }
        return mv;
    }

    // 캠핑장 사이트 등록
    @RequestMapping(value = "/campAdmin/campSiteInsert.kh", method = RequestMethod.POST)
    public ModelAndView campSiteInsert(
            @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
            @ModelAttribute CampSite campSite,
            HttpServletRequest request,
            ModelAndView mv) {
        try {
            System.out.println(campSite);
            // 세션에 있는 아이디가 어드민이 아니라면 등록하지못하도록 작동시켜야함
            int contentId = campSite.getCampId();
            // 캠프 컨트롤러에서도 contentId로 계속 쓰임
            int result = cService.printSiteListCount(contentId);
            System.out.println(result);

            // 등록시작
            String thumbnailName = uploadFile.getOriginalFilename();
            /////////////////////////// 경로,파일이름 설정
            if (!thumbnailName.equals("")) {
                String root = request.getSession().getServletContext().getRealPath("resources");
                String savePath = root + "\\ruploadFiles";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddhhss");
                String thumbnailRename = sdf.format(new Date(System.currentTimeMillis())) + "." // 시간
                        + thumbnailName.substring(thumbnailName.lastIndexOf(".") + 1); // 확장자명
                File file = new File(savePath);
                if (!file.exists()) {
                    file.mkdir();
                }
                uploadFile.transferTo(new File(savePath + "\\" + thumbnailRename));// 저장할때는 rename으로 저장 실제경로에 저장
                String thumbnailpath = savePath + "\\" + thumbnailRename;
                // 파일을 ruploadFile경로에 저장하는 메소드
                campSite.setSiteThumbnailName(thumbnailName);
                campSite.setSiteThumbnailPath(thumbnailpath);
                campSite.setSiteThumbnailRename(thumbnailRename);
            }
            int regist = cService.registerSite(campSite);

            // 처음생긴 캠핑 사이트라면 캠핑장 예약가능 Y로 수정
            if (result == 0 && regist == 1) {
                int confirm = 1;
                int update = cService.campRegistAviModify(contentId, confirm);
            }

            request.setAttribute("msg", "사이트 등록이 완료되었습니다.");
            request.setAttribute("url", "/campAdmin/campAdminSite.kh?contentId=" + campSite.getCampId());
            mv.setViewName("common/alert");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "사이트 등록 실패").setViewName("common/errorPage");
        }

        return mv;
    }

    // 캠핑장 사이트 수정창 출력
    @RequestMapping(value = "/campAdmin/campSiteModifyView.kh", method = RequestMethod.GET)
    public ModelAndView campSiteModifyView(
            @RequestParam(value = "siteNo", required = false) int siteNo,
            ModelAndView mv) {
        try {
            CampSite campSite = cService.printSite(siteNo);
            System.out.println(campSite);
            mv.addObject("campSite", campSite);
            mv.setViewName("admin/campSiteModify");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "사이트 수정창 출력 실패").setViewName("common/errorPage");
        }

        return mv;
    }

//  캠핑장 사이트 수정
    @RequestMapping(value = "/campAdmin/campSiteModify.kh", method = RequestMethod.POST)
    public ModelAndView campSiteModify(
            @RequestParam(value = "reuploadFile", required = false) MultipartFile reuploadFile,
            @ModelAttribute CampSite campSite,
            HttpServletRequest request,
            ModelAndView mv) {
        try {
            int contentId = campSite.getCampId();
            String thumbnailName = reuploadFile.getOriginalFilename();
            if (reuploadFile != null && !thumbnailName.equals("")) {
                String root = request.getSession().getServletContext().getRealPath("resources");
                String savedPath = root + "\\ruploadFiles";
                File file = new File(savedPath + "\\" + campSite.getSiteThumbnailRename());
                if (file.exists()) {
                    file.delete();
                }
                // 파일다시저장
                SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddhhmmss");
                String thumbnailRename = sdf.format(new Date(System.currentTimeMillis())) + "."
                        + thumbnailName.substring(thumbnailName.lastIndexOf(".") + 1);
                String thumbnailpath = savedPath + "\\" + thumbnailRename;
                reuploadFile.transferTo(new File(thumbnailpath));
                campSite.setSiteThumbnailName(thumbnailName);
                campSite.setSiteThumbnailPath(thumbnailpath);
                campSite.setSiteThumbnailRename(thumbnailRename);
            }

            int result = cService.modifySite(campSite);

            request.setAttribute("msg", "사이트 정보 수정이 완료되었습니다.");
            request.setAttribute("url", "/campAdmin/campAdminSite.kh?contentId=" + contentId);
            mv.setViewName("common/alert");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "사이트 수정 실패").setViewName("common/errorPage");
        }

        return mv;
    }

    // 캠핑장 사이트 삭제
    @RequestMapping(value = "/campAdmin/campSiteRemove.kh", method = RequestMethod.GET)
    public ModelAndView campSiteRemove(
            @RequestParam(value = "contentId", required = false) int contentId,
            @RequestParam(value = "siteNo", required = false) int siteNo,
            HttpServletRequest request,
            ModelAndView mv) {
        try {
            CampSite campSite = cService.printSite(siteNo);
            int remove = cService.removeSite(siteNo);
            int result = cService.printSiteListCount(contentId);

            // 사진파일도 삭제
            String root = request.getSession().getServletContext().getRealPath("resources");
            String savedPath = root + "\\ruploadFiles";
            File file = new File(savedPath + "\\" + campSite.getSiteThumbnailRename());
            if (file.exists()) {
                file.delete();
            }

            // 삭제로 사이트수가 0이 된다면 예약가능 N로 수정
            if (result == 0) {
                int confirm = 0;
                int update = cService.campRegistAviModify(contentId, confirm);
            }

            mv.setViewName("redirect:/campAdmin/campAdminSite.kh?contentId=" + contentId);
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "사이트 삭제 실패").setViewName("common/errorPage");
        }

        return mv;
    }

    // 캠핑장 예약가능여부 컨트롤
    @RequestMapping(value = "/campAdmin/campRegistAviCon.kh", method = RequestMethod.GET)
    public ModelAndView campRegistAviCon(
            @RequestParam(value = "contentId", required = false) int contentId,
            HttpServletRequest request,
            ModelAndView mv) {
        try {
            int result = cService.printSiteListCount(contentId);
            if (result == 0) {
                request.setAttribute("msg", "사이트를 먼저 등록해주세요.");
                request.setAttribute("url", "/campAdmin/campAdminSite.kh?contentId=" + contentId);
                mv.setViewName("common/alert");
                return mv;
            }
            Camp camp = cService.printCampDetail(contentId);
            if (camp.getRegistAvi().equals("Y")) {
                int confirm = 0;
                int update = cService.campRegistAviModify(contentId, confirm);
            } else {
                int confirm = 1;
                int update = cService.campRegistAviModify(contentId, confirm);
            }
            mv.setViewName("redirect:/campAdmin/campAdminSite.kh?contentId=" + contentId);
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("msg", "정보 수정 실패").setViewName("common/errorPage");
        }
        return mv;
    }

    // 캠핑장 데이터 db 등록
    @RequestMapping(value = "/campAdmin/campInsert.kh", method = RequestMethod.GET)
    public String campInsert() {
        try {
            StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/GoCamping/basedList");

            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
                    + "=qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D");
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*
                                                                                                                    * 페이지
                                                                                                                    * 번호
                                                                                                                    */
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
                    + URLEncoder.encode("3243", "UTF-8")); /* 한 페이지 결과 수 */
            urlBuilder.append(
                    "&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("WIN", "UTF-8")); /* OS */
            urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
                    + URLEncoder.encode("seulcam", "UTF-8")); /* 서비스명 */
            urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*
                                                                                                                      * 응답데이터
                                                                                                                      * 형식
                                                                                                                      * (
                                                                                                                      * xml
                                                                                                                      * /
                                                                                                                      * json)
                                                                                                                      * default
                                                                                                                      * :
                                                                                                                      * xml
                                                                                                                      */
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            System.out.println("Response code: " + conn.getResponseCode());
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            JSONParser parser = new JSONParser();
            // json data 최상단
            JSONObject objmain = (JSONObject) parser.parse(sb.toString());
            // json.response
            JSONObject objResponse = (JSONObject) parser.parse(objmain.get("response").toString());
            // json.response.body 여기에 "numOfRows""pageNo""totalCount" 있음
            JSONObject objBody = (JSONObject) parser.parse(objResponse.get("body").toString());
            // json.response.body.items
            JSONObject objItems = (JSONObject) parser.parse(objBody.get("items").toString());
            // json.response.body.items.item item을 json배열에 담음
            JSONArray itemArr = (JSONArray) parser.parse(objItems.get("item").toString());

            List<Camp> cList = new ArrayList<Camp>();
            System.out.println("생성시작");
            for (int i = 0; i < itemArr.size(); i++) {
                JSONObject item = (JSONObject) parser.parse(itemArr.get(i).toString());
                Camp camp = new Camp();
                camp.setContentId(Integer.valueOf(item.get("contentId").toString()));
                ;
                camp.setFacltNm(item.get("facltNm").toString());
                camp.setLineIntro(item.get("lineIntro").toString());
                camp.setIntro(item.get("intro").toString());
                camp.setBizrno(item.get("bizrno").toString());
                camp.setFeatureNm(item.get("featureNm").toString());
                camp.setInduty(item.get("induty").toString());
                camp.setLctCl(item.get("lctCl").toString());
                camp.setDoNm(item.get("doNm").toString());
                camp.setSigunguNm(item.get("sigunguNm").toString());
                camp.setZipcode(item.get("zipcode").toString());
                camp.setAddr1(item.get("addr1").toString());
                camp.setTel(item.get("tel").toString());
                camp.setMapX(item.get("mapX").toString());
                camp.setMapY(item.get("mapY").toString());
                camp.setHomepage(item.get("homepage").toString());
                camp.setResveUrl(item.get("resveUrl").toString());
                camp.setTooltip(item.get("tooltip").toString());
                camp.setGlampInnerFclty(item.get("glampInnerFclty").toString());
                camp.setCaravInnerFclty(item.get("caravInnerFclty").toString());
                camp.setOperPdCl(item.get("operPdCl").toString());
                camp.setOperDeCl(item.get("operDeCl").toString());
                camp.setSbrsCl(item.get("sbrsCl").toString());
                camp.setSbrsEtc(item.get("sbrsEtc").toString());
                camp.setAnimalCmgCl(item.get("animalCmgCl").toString());
                camp.setTourEraCl(item.get("tourEraCl").toString());
                camp.setFirstImageUrl(item.get("firstImageUrl").toString());
                cList.add(camp);
            }
            System.out.println("저장시작");
            int c = 0;
            for (int i = 0; i < cList.size(); i++) {
                int result = cService.insertCampList(cList.get(i));
                c++;
            }
            System.out.println("저장완료 : " + c);

        } catch (Exception e) {
            e.getStackTrace();
            System.out.println(e.getMessage());
            return null;
        }
        return "admin/campMain";
    }
}
