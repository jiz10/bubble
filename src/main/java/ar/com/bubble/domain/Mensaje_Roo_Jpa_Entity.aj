// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.domain;

import ar.com.bubble.domain.Mensaje;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Mensaje_Roo_Jpa_Entity {
    
    declare @type: Mensaje: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Mensaje.id;
    
    @Version
    @Column(name = "version")
    private Integer Mensaje.version;
    
    public Long Mensaje.getId() {
        return this.id;
    }
    
    public void Mensaje.setId(Long id) {
        this.id = id;
    }
    
    public Integer Mensaje.getVersion() {
        return this.version;
    }
    
    public void Mensaje.setVersion(Integer version) {
        this.version = version;
    }
    
}
