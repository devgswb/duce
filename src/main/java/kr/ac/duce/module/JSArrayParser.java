package kr.ac.duce.module;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import org.springframework.boot.configurationprocessor.json.JSONArray;

import java.lang.reflect.Type;
import java.util.ArrayList;

public class JSArrayParser<T> {
    public ArrayList<T> parse(String JSArray, Class<T> cls) {
        ArrayList<T> List = new ArrayList<T>();
        JsonParser parser = new JsonParser();
        Gson gson = new Gson();
        try {
            JsonArray array = (JsonArray) ((JsonObject) parser.parse(JSArray)).get("list");
            for (JsonElement ele : array) {
                List.add(gson.fromJson(ele, cls));
            }
        } catch (Exception ex) {
            throw ex;
        }
        return List;
    }
}
