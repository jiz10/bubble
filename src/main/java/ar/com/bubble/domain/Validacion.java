package ar.com.bubble.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Validacion {

    /**
     */
    @ManyToOne
    private Usuario usuario;

    /**
     */
    private String userName;

    /**
     */
    private String password;
}
