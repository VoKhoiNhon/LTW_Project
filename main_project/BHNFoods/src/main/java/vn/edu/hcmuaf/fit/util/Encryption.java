package vn.edu.hcmuaf.fit.util;

import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;


public class Encryption {
    public static String toSHA1(String str) {
        String salt = "asfavktrgovndalef";
        String result = null;
        str = str + salt;
        try {
            byte[] dataByte = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.encodeBase64String(md.digest(dataByte));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(toSHA1("123456"));
    }
}
