package ar.com.bubble.domain;
import javax.persistence.OneToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;


import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Usuario {

    /**
     */
    private String apellido;

    /**
     */
    private String nombre;
    
    /**
     */
    @OneToOne
    private Validacion userData;
}
