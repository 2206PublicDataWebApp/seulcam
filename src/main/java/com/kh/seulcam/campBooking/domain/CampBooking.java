package com.kh.seulcam.campBooking.domain;

import java.sql.Date;

import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.CampSite;

public class CampBooking {
    private int bookingNo;
    private String memberId;
    private int siteNo;
    private String bookName;
    private String bookPhone;
    private String bookRequest;
    private int bookPeople;
    private String firstDay;
    private String lastDay;
    private int totalDay;
    private int bookIniPrice;
    private int bookExtra;
    private int bookUsePoint;
    private int bookGetPoint;
    private int bookTotalPrice;
    private Date bookDate;
    private String bookPayStatus;
    private String bookCancleStatus;
    private String bookRefundStatus;
    private Camp camp;
    private CampSite campSite;
    
    
    public CampBooking() {}


    public CampBooking(int bookingNo, String memberId, int siteNo, String bookName, String bookPhone,
            String bookRequest, int bookPeople, String firstDay, String lastDay, int totalDay, int bookIniPrice,
            int bookExtra, int bookUsePoint, int bookGetPoint, int bookTotalPrice, Date bookDate, String bookPayStatus,
            String bookCancleStatus, String bookRefundStatus) {
        this.bookingNo = bookingNo;
        this.memberId = memberId;
        this.siteNo = siteNo;
        this.bookName = bookName;
        this.bookPhone = bookPhone;
        this.bookRequest = bookRequest;
        this.bookPeople = bookPeople;
        this.firstDay = firstDay;
        this.lastDay = lastDay;
        this.totalDay = totalDay;
        this.bookIniPrice = bookIniPrice;
        this.bookExtra = bookExtra;
        this.bookUsePoint = bookUsePoint;
        this.bookGetPoint = bookGetPoint;
        this.bookTotalPrice = bookTotalPrice;
        this.bookDate = bookDate;
        this.bookPayStatus = bookPayStatus;
        this.bookCancleStatus = bookCancleStatus;
        this.bookRefundStatus = bookRefundStatus;
    }


    @Override
    public String toString() {
        return "CampBooking [bookingNo=" + bookingNo + ", memberId=" + memberId + ", siteNo=" + siteNo + ", bookName="
                + bookName + ", bookPhone=" + bookPhone + ", bookRequest=" + bookRequest + ", bookPeople=" + bookPeople
                + ", firstDay=" + firstDay + ", lastDay=" + lastDay + ", totalDay=" + totalDay + ", bookIniPrice="
                + bookIniPrice + ", bookExtra=" + bookExtra + ", bookUsePoint=" + bookUsePoint + ", bookGetPoint="
                + bookGetPoint + ", bookTotalPrice=" + bookTotalPrice + ", bookDate=" + bookDate + ", bookPayStatus="
                + bookPayStatus + ", bookCancleStatus=" + bookCancleStatus + ", bookRefundStatus=" + bookRefundStatus
                + "]";
    }


    public Camp getCamp() {
        return camp;
    }


    public void setCamp(Camp camp) {
        this.camp = camp;
    }


    public CampSite getCampSite() {
        return campSite;
    }


    public void setCampSite(CampSite campSite) {
        this.campSite = campSite;
    }


    public int getBookingNo() {
        return bookingNo;
    }


    public void setBookingNo(int bookingNo) {
        this.bookingNo = bookingNo;
    }


    public String getMemberId() {
        return memberId;
    }


    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }


    public int getSiteNo() {
        return siteNo;
    }


    public void setSiteNo(int siteNo) {
        this.siteNo = siteNo;
    }


    public String getBookName() {
        return bookName;
    }


    public void setBookName(String bookName) {
        this.bookName = bookName;
    }


    public String getBookPhone() {
        return bookPhone;
    }


    public void setBookPhone(String bookPhone) {
        this.bookPhone = bookPhone;
    }


    public String getBookRequest() {
        return bookRequest;
    }


    public void setBookRequest(String bookRequest) {
        this.bookRequest = bookRequest;
    }


    public int getBookPeople() {
        return bookPeople;
    }


    public void setBookPeople(int bookPeople) {
        this.bookPeople = bookPeople;
    }


    public String getFirstDay() {
        return firstDay;
    }


    public void setFirstDay(String firstDay) {
        this.firstDay = firstDay;
    }


    public String getLastDay() {
        return lastDay;
    }


    public void setLastDay(String lastDay) {
        this.lastDay = lastDay;
    }


    public int getTotalDay() {
        return totalDay;
    }


    public void setTotalDay(int totalDay) {
        this.totalDay = totalDay;
    }


    public int getBookIniPrice() {
        return bookIniPrice;
    }


    public void setBookIniPrice(int bookIniPrice) {
        this.bookIniPrice = bookIniPrice;
    }


    public int getBookExtra() {
        return bookExtra;
    }


    public void setBookExtra(int bookExtra) {
        this.bookExtra = bookExtra;
    }


    public int getBookUsePoint() {
        return bookUsePoint;
    }


    public void setBookUsePoint(int bookUsePoint) {
        this.bookUsePoint = bookUsePoint;
    }


    public int getBookGetPoint() {
        return bookGetPoint;
    }


    public void setBookGetPoint(int bookGetPoint) {
        this.bookGetPoint = bookGetPoint;
    }


    public int getBookTotalPrice() {
        return bookTotalPrice;
    }


    public void setBookTotalPrice(int bookTotalPrice) {
        this.bookTotalPrice = bookTotalPrice;
    }


    public Date getBookDate() {
        return bookDate;
    }


    public void setBookDate(Date bookDate) {
        this.bookDate = bookDate;
    }


    public String getBookPayStatus() {
        return bookPayStatus;
    }


    public void setBookPayStatus(String bookPayStatus) {
        this.bookPayStatus = bookPayStatus;
    }


    public String getBookCancleStatus() {
        return bookCancleStatus;
    }


    public void setBookCancleStatus(String bookCancleStatus) {
        this.bookCancleStatus = bookCancleStatus;
    }


    public String getBookRefundStatus() {
        return bookRefundStatus;
    }


    public void setBookRefundStatus(String bookRefundStatus) {
        this.bookRefundStatus = bookRefundStatus;
    }


   
    
}
