package vn.edu.hcmuaf.fit.util;

import org.apache.commons.codec.binary.Base64;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.net.*;

public class Brower {
    public static String getBrowerName(String userAgent) {
        String browserName = "Unknown";
        if (userAgent.indexOf("Firefox") > -1) {
            browserName = "Mozilla Firefox";
        } else if (userAgent.indexOf("Edg") > -1 || userAgent.indexOf("Edge") > -1) {
            browserName = "Microsoft Edge";
        } else if (userAgent.indexOf("OPR") > -1 || userAgent.indexOf("Opera") > -1) {
            browserName = "Opera";
        } else if (userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Edg") == -1) {
            browserName = "Google Chrome";
        } else if (userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1) {
            browserName = "Apple Safari";
        } else {
            browserName = "unknown";
        }
        return browserName;
    }

    public static String getIpWlanConect() {
        String ip = null;
        try {
            URL url = new URL("https://checkip.amazonaws.com/");
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
            ip = br.readLine();
        } catch (Exception e) {
        }
        return ip;
    }

    public static String getLocationIp(String ipAddress) throws IOException {
        if (ipAddress.equals("0:0:0:0:0:0:0:1")) {
            // Nếu địa chỉ IP là IPv6 của localhost, sử dụng IPv4 thay thế
            ipAddress = Brower.getIpWlanConect();
        }
        String url = "https://api.ipgeolocation.io/ipgeo?apiKey=25bf311674ee44249298d45dcd86a649&ip=" + ipAddress;
        URLConnection connection = new URL(url).openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String inputLine;
        StringBuffer responses = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            responses.append(inputLine);
        }
        in.close();
        String location = responses.toString();

        return "IP Address: " + location;
    }


}