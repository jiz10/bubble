// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.domain;

import ar.com.bubble.domain.Rol;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Rol_Roo_Json {
    
    public String Rol.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Rol.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Rol Rol.fromJsonToRol(String json) {
        return new JSONDeserializer<Rol>()
        .use(null, Rol.class).deserialize(json);
    }
    
    public static String Rol.toJsonArray(Collection<Rol> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Rol.toJsonArray(Collection<Rol> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Rol> Rol.fromJsonArrayToRols(String json) {
        return new JSONDeserializer<List<Rol>>()
        .use("values", Rol.class).deserialize(json);
    }
    
}