package com.ict.finalproject.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;


public class Tosspayment {

    public static JSONObject payment(String paymentKey,String orderId, int amount) {
        String url = "https://api.tosspayments.com/v1/payments/confirm";
        String authorizationHeader = "Basic dGVzdF9za19MbERKYVluZ3Jvamx4OW83bzFFeVZlekdkUnBYOg==";

        Map<String, Object> requestData = new HashMap<>();
        requestData.put("paymentKey", paymentKey);
        requestData.put("orderId", orderId);
        requestData.put("amount", amount);
        JSONObject json_data = new JSONObject();
        try {
            CloseableHttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            httpPost.setHeader("Authorization", authorizationHeader);
            httpPost.setHeader("Content-Type", "application/json");

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(requestData);
            StringEntity entity = new StringEntity(json);
            httpPost.setEntity(entity);

            HttpResponse response = client.execute(httpPost);
            String responseString = EntityUtils.toString(response.getEntity(), "UTF-8");

           json_data = new JSONObject(responseString);

            System.out.println("Response: " + responseString);

            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return json_data;
    }

    public static JSONObject cancle(String paymentKey,long res_payment) {
        String url = String.format("https://api.tosspayments.com/v1/payments/%s/cancel", paymentKey);
        String authorizationHeader = "Basic dGVzdF9za19MbERKYVluZ3Jvamx4OW83bzFFeVZlekdkUnBYOg==";

        Map<String, Object> requestData = new HashMap<>();
        requestData.put("cancelReason", "단순변심");


        JSONObject json_data = new JSONObject();
        try {
            CloseableHttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            httpPost.setHeader("Authorization", authorizationHeader);
            httpPost.setHeader("Content-Type", "application/json");

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(requestData);
            StringEntity entity = new StringEntity(json);
            httpPost.setEntity(entity);

            HttpResponse response = client.execute(httpPost);
            String responseString = EntityUtils.toString(response.getEntity(), "UTF-8");

           json_data = new JSONObject(responseString);

            System.out.println("Response: " + responseString);

            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return json_data;
    }

    public static String receipt(String url) {
        String authorizationHeader = "Basic dGVzdF9za19MbERKYVluZ3Jvamx4OW83bzFFeVZlekdkUnBYOg==";

        Map<String, Object> requestData = new HashMap<>();

        String html = "";
        try {
            CloseableHttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            httpPost.setHeader("Authorization", authorizationHeader);
            // httpPost.setHeader("Content-Type", "application/json");

            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(requestData);
            StringEntity entity = new StringEntity(json);
            httpPost.setEntity(entity);

            HttpResponse response = client.execute(httpPost);
            String responseString = EntityUtils.toString(response.getEntity(), "UTF-8");

            html = responseString;

            System.out.println("html : "+html);

            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return html;
    }


}
