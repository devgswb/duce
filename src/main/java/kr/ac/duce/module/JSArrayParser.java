package kr.ac.duce.module;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;

import java.io.FileNotFoundException;
import java.io.FileReader;
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

    public ArrayList<T> parse(String JSArray, Class<T> cls, String key) {
        ArrayList<T> List = new ArrayList<T>();
        JsonParser parser = new JsonParser();
        Gson gson = new Gson();
        try {
            JsonArray array = (JsonArray) ((JsonObject) parser.parse(JSArray)).get(key);
            for (JsonElement ele : array) {
                List.add(gson.fromJson(ele, cls));
            }
        } catch (Exception ex) {
            throw ex;
        }
        return List;
    }

    public ArrayList<T> fileparse(String filePath, Class<T> cls, String key) throws FileNotFoundException {
        Gson gson = new Gson();
        ArrayList<T> List = new ArrayList<T>();
        JsonParser parser = new JsonParser();
        try {
            JsonReader reader = new JsonReader(new FileReader(filePath));
            JsonObject jsonObject = (JsonObject) parser.parse(reader);
            JsonArray array = (JsonArray) jsonObject.get(key);
            for (JsonElement ele : array) {
                List.add(gson.fromJson(ele, cls));
            }
        } catch (Exception ex) {
            throw ex;
        }
        return List;
    }
}
