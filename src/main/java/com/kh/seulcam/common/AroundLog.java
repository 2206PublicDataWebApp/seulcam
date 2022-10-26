package com.kh.seulcam.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
@Component
@Aspect
public class AroundLog {
	
	@Pointcut("execution(* com.kh.seulcam..*Impl.*(..))")
	public void allPointCut() {}
	
	@Around("allPointCut()")
	public Object aroundLogs(ProceedingJoinPoint pp) throws Throwable{
		//proceeduingJoinPoint는 joinPoint를 상속받아 구현된 인터페이스
		//를 사용하는 이유는 advice가 실행되는 시점을 프로그래밍하기 위해서
		//aroundLogs는 ProceedingJoinPoint와 같이 써야함
		StopWatch stopWatch = new StopWatch();
		//start
		stopWatch.start();
		Object obj = pp.proceed(); //여기가 시점을 캐치하는곳
		//stop
		stopWatch.stop();
		//메소드가 실행되는 시간 출력
		String methodName = pp.getSignature().getName();
		System.out.println(methodName +"() 메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis()+"(ms)");
		return obj;
	}
}
