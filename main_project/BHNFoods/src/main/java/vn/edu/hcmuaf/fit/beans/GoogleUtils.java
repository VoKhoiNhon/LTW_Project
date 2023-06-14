package vn.edu.hcmuaf.fit.beans;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleUtils {
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(ConstantsGG.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", ConstantsGG.GOOGLE_CLIENT_ID)
                        .add("client_secret", ConstantsGG.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri",ConstantsGG.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", ConstantsGG.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = ConstantsGG.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        User googlePojo = new Gson().fromJson(response, User.class);
        System.out.println(googlePojo);
        return googlePojo;

    }
}
