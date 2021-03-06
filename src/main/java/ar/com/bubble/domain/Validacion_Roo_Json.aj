// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.domain;

import ar.com.bubble.domain.Validacion;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Validacion_Roo_Json {
    
    public String Validacion.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Validacion.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Validacion Validacion.fromJsonToValidacion(String json) {
        return new JSONDeserializer<Validacion>()
        .use(null, Validacion.class).deserialize(json);
    }
    
    public static String Validacion.toJsonArray(Collection<Validacion> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Validacion.toJsonArray(Collection<Validacion> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Validacion> Validacion.fromJsonArrayToValidacions(String json) {
        return new JSONDeserializer<List<Validacion>>()
        .use("values", Validacion.class).deserialize(json);
    }
    
}
