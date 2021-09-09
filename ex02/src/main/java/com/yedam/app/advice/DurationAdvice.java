package com.yedam.app.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
//@Aspect
public class DurationAdvice {

	@Around("LogAdvice.allpointcut()")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		
		Object obj = null;
		
		try {
			// 서비스 메소드 호출
			obj = pjp.proceed();	
		} catch (Throwable e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		log.info("Time > " + (end-start));
		return obj;
		
	}
}
