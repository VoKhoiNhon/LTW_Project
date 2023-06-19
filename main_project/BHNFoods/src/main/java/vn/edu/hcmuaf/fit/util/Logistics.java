package vn.edu.hcmuaf.fit.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Logistics {
    public static String getToken() throws Exception {
        String apiUrl = "http://140.238.54.136/api/auth/login";
        String email = "khoinhon123@gmail.com";
        String password = "12345678";

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");

            String requestBody = "{\"email\":\"" + email + "\",\"password\":\"" + password + "\"}";

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(requestBody.getBytes());
            outputStream.flush();

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();

                JSONParser parser = new JSONParser();
                JSONObject jsonObject = (JSONObject) parser.parse(response.toString());
                String accessToken = (String) jsonObject.get("access_token");
                return accessToken;
            } else {
                System.out.println("Request failed with response code: " + responseCode);
            }

            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Map<String, Integer> getProvince() throws Exception {
        Map<String, Integer> map = new HashMap<>();
        String url = "http://140.238.54.136/api/province";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // Set the request method
        con.setRequestMethod("GET");

        // Set the request headers
        con.setRequestProperty("Authorization", "Bearer " + getToken());

        // Enable CORS
        con.setRequestProperty("Origin", "*");

        // Send the GET request
        int responseCode = con.getResponseCode();

        // Read the response
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        // Print the response
        System.out.println(response.toString());
        try {
            JSONParser parser = new JSONParser();
            JSONObject res = (JSONObject) parser.parse(response.toString());
            JSONObject original = (JSONObject) res.get("original");
            JSONArray data = (JSONArray) original.get("data");

            for (Object ob : data) {
                JSONObject province = (JSONObject) ob;
                int provinceID = Integer.parseInt(province.get("ProvinceID").toString());
                String provinceName = (String) province.get("ProvinceName");

                map.put(provinceName, provinceID);
//                System.out.println("Province ID: " + provinceID);
//                System.out.println("Province Name: " + provinceName);
//                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    return map;
    }

    public static Map<String, Integer> getDistrict(int provinceID) throws Exception {
        Map<String, Integer> map = new HashMap<>();
        String url = "http://140.238.54.136/api/district?provinceID=" + provinceID;
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // Set the request method
        con.setRequestMethod("GET");

        // Set the request headers
        con.setRequestProperty("Authorization", "Bearer " + getToken());

        // Enable CORS
        con.setRequestProperty("Origin", "*");

        // Send the GET request
        int responseCode = con.getResponseCode();

        // Read the response
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        // Print the response
        System.out.println(response.toString());
        try {
            JSONParser parser = new JSONParser();
            JSONObject res = (JSONObject) parser.parse(response.toString());
            JSONObject original = (JSONObject) res.get("original");
            JSONArray data = (JSONArray) original.get("data");

            for (Object ob : data) {
                JSONObject province = (JSONObject) ob;
                int districtID = Integer.parseInt(province.get("DistrictID").toString());
                String districtName = (String) province.get("DistrictName");

                map.put(districtName, districtID);
//                System.out.println("DistrictID: " + districtID);
//                System.out.println("DistrictName: " + districtName);
//                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    public static Map<String, Integer> getWard(int districtID) throws Exception {
        Map<String, Integer> map = new HashMap<>();
        String url = "http://140.238.54.136/api/ward?districtID=" + districtID;
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        // Set the request method
        con.setRequestMethod("GET");

        // Set the request headers
        con.setRequestProperty("Authorization", "Bearer " + getToken());

        // Enable CORS
        con.setRequestProperty("Origin", "*");

        // Send the GET request
        int responseCode = con.getResponseCode();

        // Read the response
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        // Print the response
        System.out.println(response.toString());
        try {
            JSONParser parser = new JSONParser();
            JSONObject res = (JSONObject) parser.parse(response.toString());
            JSONObject original = (JSONObject) res.get("original");
            JSONArray data = (JSONArray) original.get("data");

            for (Object ob : data) {
                JSONObject province = (JSONObject) ob;

                int wardCode = Integer.parseInt(province.get("WardCode").toString());
                String wardName = (String) province.get("WardName");
                map.put(wardName, wardCode);
//                System.out.println("wardCode: " + wardCode);
//                System.out.println("wardName: " + wardName);
//                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }

    public static String getLeadTime(int ditricID, int wardID, int height, int lenght, int width, int weight) {
        String apiUrl = "http://140.238.54.136/api/leadTime";
        String json = null;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "Bearer " + getToken());

            // Enable CORS
            connection.setRequestProperty("Origin", "*");

            String requestBody = "" +
                    "{\"from_district_id\":\"" + 1463 + "\",\"from_ward_id\":\"" + 21808 + "\"," +
                    "\"to_district_id\":\"" + ditricID + "\",\"to_ward_id\":\"" + wardID + "\"," +
                    "\"height\":\"" + height + "\",\"length\":\"" + lenght + "\"," +
                    "\"width\":\"" + width + "\",\"weight\":\"" + weight + "\"}" +
                    "";

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(requestBody.getBytes());
            outputStream.flush();

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
                json = response.toString();
//                System.out.println(json);

            } else {
                System.out.println("Request failed with response code: " + responseCode);
            }
            JSONParser parser = new JSONParser();
            JSONObject response = (JSONObject) parser.parse(json);
            JSONArray data = (JSONArray) response.get("data");

            for (Object obj : data) {
                JSONObject entry = (JSONObject) obj;
                long timestamp = (long) entry.get("timestamp");
                String formattedDate = (String) entry.get("formattedDate");

                System.out.println("Timestamp: " + timestamp);
                System.out.println("Formatted Date: " + formattedDate);
                System.out.println();
                return formattedDate;
            }
            connection.disconnect();
          } catch (Exception e) {
            throw new RuntimeException(e);
        }
    return null;
    }
    public static int getCalculateFee(int ditricID, int wardID, int height, int lenght, int width, int weight) {
        String apiUrl = "http://140.238.54.136/api/calculateFee";
        String json = null;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "Bearer " + getToken());

            // Enable CORS
            connection.setRequestProperty("Origin", "*");

            String requestBody = "" +
                    "{\"from_district_id\":\"" + 1463 + "\",\"from_ward_id\":\"" + 21808 + "\"," +
                    "\"to_district_id\":\"" + ditricID + "\",\"to_ward_id\":\"" + wardID + "\"," +
                    "\"height\":\"" + height + "\",\"length\":\"" + lenght + "\"," +
                    "\"width\":\"" + width + "\",\"weight\":\"" + weight + "\"}" +
                    "";

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(requestBody.getBytes());
            outputStream.flush();

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
                json = response.toString();
                JSONParser parser = new JSONParser();
                JSONObject resp = (JSONObject) parser.parse(json);
                JSONArray data = (JSONArray) resp.get("data");

                for (Object obj : data) {
                    JSONObject entry = (JSONObject) obj;
                    long serviceFee = (long) entry.get("service_fee");

                    System.out.println("Service Fee: " + serviceFee);
                    System.out.println();
                    return (int) serviceFee;
                }

            } else {
                System.out.println("Request failed with response code: " + responseCode);
            }

            connection.disconnect();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    return 0;
    }
    public static void registerTransport(int ditricID, int wardID, int height, int lenght, int width, int weight) {
        String apiUrl = "http://140.238.54.136/api/registerTransport";
        String json = null;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "Bearer " + getToken());

            String requestBody = "" +
                    "{\"from_district_id\":\"" + 1463 + "\",\"from_ward_id\":\"" + 21808 + "\"," +
                    "\"to_district_id\":\"" + ditricID + "\",\"to_ward_id\":\"" + wardID + "\"," +
                    "\"height\":\"" + height + "\",\"length\":\"" + lenght + "\"," +
                    "\"width\":\"" + width + "\",\"weight\":\"" + weight + "\"}" +
                    "";

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(requestBody.getBytes());
            outputStream.flush();

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
                json = response.toString();
                System.out.println(json);

            } else {
                System.out.println("Request failed with response code: " + responseCode);
            }

            connection.disconnect();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
    public static void main(String[] args) throws Exception {
//        System.out.println(getToken());
//        Map<String, Integer> map = getProvince();
//        System.out.println(map.get("Lạng Sơn"));
//        Map<String, Integer> map1 = getDistrict(247);
//        System.out.println(map1.get("Huyện Bắc Sơn"));
//        Map<String, Integer> map2 = getWard(3134);
//        System.out.println(map2.get("Xã Vũ Sơn"));
//        getWard(1463);
//        getLeadTime(1463, 21809, 30, 30, 30, 5000);
        getLeadTime(1463, 21809, 30, 30, 30, 15000);
//        getCalculateFee(1463, 21809, 30, 30, 30, 5000);
//        registerTransport(1463, 21809, 30, 30, 30, 1000);
    }
}
