package com.ideau.API.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, String>> handleException(Exception e) {
        int intStatus;
        String strStatus;
        HttpStatus httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;

        try {
            strStatus = e.getMessage().substring(0, 3);
            intStatus = Integer.parseInt(strStatus);
            httpStatus = HttpStatus.valueOf(intStatus);
        } catch (Exception ex) {
            //Não relança pra não sobreescrever a exceção real
        }
        return ResponseEntity
                .status(httpStatus)
                .body(Map.of("message", e.getMessage()));
    }
}