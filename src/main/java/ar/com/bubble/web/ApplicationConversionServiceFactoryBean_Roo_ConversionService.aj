// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.web;

import ar.com.bubble.domain.Mensaje;
import ar.com.bubble.domain.PM;
import ar.com.bubble.domain.Rol;
import ar.com.bubble.domain.Tag;
import ar.com.bubble.domain.Tweet;
import ar.com.bubble.domain.Usuario;
import ar.com.bubble.domain.Validacion;
import ar.com.bubble.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Mensaje, String> ApplicationConversionServiceFactoryBean.getMensajeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.Mensaje, java.lang.String>() {
            public String convert(Mensaje mensaje) {
                return new StringBuilder().append(mensaje.getContenido()).toString();
            }
        };
    }
    
    public Converter<Long, Mensaje> ApplicationConversionServiceFactoryBean.getIdToMensajeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.Mensaje>() {
            public ar.com.bubble.domain.Mensaje convert(java.lang.Long id) {
                return Mensaje.findMensaje(id);
            }
        };
    }
    
    public Converter<String, Mensaje> ApplicationConversionServiceFactoryBean.getStringToMensajeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.Mensaje>() {
            public ar.com.bubble.domain.Mensaje convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Mensaje.class);
            }
        };
    }
    
    public Converter<PM, String> ApplicationConversionServiceFactoryBean.getPMToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.PM, java.lang.String>() {
            public String convert(PM pM) {
                return new StringBuilder().append(pM.getContenido()).toString();
            }
        };
    }
    
    public Converter<Long, PM> ApplicationConversionServiceFactoryBean.getIdToPMConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.PM>() {
            public ar.com.bubble.domain.PM convert(java.lang.Long id) {
                return PM.findPM(id);
            }
        };
    }
    
    public Converter<String, PM> ApplicationConversionServiceFactoryBean.getStringToPMConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.PM>() {
            public ar.com.bubble.domain.PM convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PM.class);
            }
        };
    }
    
    public Converter<Rol, String> ApplicationConversionServiceFactoryBean.getRolToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.Rol, java.lang.String>() {
            public String convert(Rol rol) {
                return new StringBuilder().append(rol.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Rol> ApplicationConversionServiceFactoryBean.getIdToRolConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.Rol>() {
            public ar.com.bubble.domain.Rol convert(java.lang.Long id) {
                return Rol.findRol(id);
            }
        };
    }
    
    public Converter<String, Rol> ApplicationConversionServiceFactoryBean.getStringToRolConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.Rol>() {
            public ar.com.bubble.domain.Rol convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Rol.class);
            }
        };
    }
    
    public Converter<Tag, String> ApplicationConversionServiceFactoryBean.getTagToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.Tag, java.lang.String>() {
            public String convert(Tag tag) {
                return new StringBuilder().append(tag.getNombre()).toString();
            }
        };
    }
    
    public Converter<Long, Tag> ApplicationConversionServiceFactoryBean.getIdToTagConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.Tag>() {
            public ar.com.bubble.domain.Tag convert(java.lang.Long id) {
                return Tag.findTag(id);
            }
        };
    }
    
    public Converter<String, Tag> ApplicationConversionServiceFactoryBean.getStringToTagConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.Tag>() {
            public ar.com.bubble.domain.Tag convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Tag.class);
            }
        };
    }
    
    public Converter<Tweet, String> ApplicationConversionServiceFactoryBean.getTweetToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.Tweet, java.lang.String>() {
            public String convert(Tweet tweet) {
                return new StringBuilder().append(tweet.getContenido()).toString();
            }
        };
    }
    
    public Converter<Long, Tweet> ApplicationConversionServiceFactoryBean.getIdToTweetConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.Tweet>() {
            public ar.com.bubble.domain.Tweet convert(java.lang.Long id) {
                return Tweet.findTweet(id);
            }
        };
    }
    
    public Converter<String, Tweet> ApplicationConversionServiceFactoryBean.getStringToTweetConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.Tweet>() {
            public ar.com.bubble.domain.Tweet convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Tweet.class);
            }
        };
    }
    
    public Converter<Usuario, String> ApplicationConversionServiceFactoryBean.getUsuarioToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.Usuario, java.lang.String>() {
            public String convert(Usuario usuario) {
                return new StringBuilder().append(usuario.getApellido()).append(' ').append(usuario.getNombre()).toString();
            }
        };
    }
    
    public Converter<Long, Usuario> ApplicationConversionServiceFactoryBean.getIdToUsuarioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.Usuario>() {
            public ar.com.bubble.domain.Usuario convert(java.lang.Long id) {
                return Usuario.findUsuario(id);
            }
        };
    }
    
    public Converter<String, Usuario> ApplicationConversionServiceFactoryBean.getStringToUsuarioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.Usuario>() {
            public ar.com.bubble.domain.Usuario convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Usuario.class);
            }
        };
    }
    
    public Converter<Validacion, String> ApplicationConversionServiceFactoryBean.getValidacionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<ar.com.bubble.domain.Validacion, java.lang.String>() {
            public String convert(Validacion validacion) {
                return new StringBuilder().append(validacion.getUser()).append(' ').append(validacion.getPassword()).toString();
            }
        };
    }
    
    public Converter<Long, Validacion> ApplicationConversionServiceFactoryBean.getIdToValidacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, ar.com.bubble.domain.Validacion>() {
            public ar.com.bubble.domain.Validacion convert(java.lang.Long id) {
                return Validacion.findValidacion(id);
            }
        };
    }
    
    public Converter<String, Validacion> ApplicationConversionServiceFactoryBean.getStringToValidacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, ar.com.bubble.domain.Validacion>() {
            public ar.com.bubble.domain.Validacion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Validacion.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getMensajeToStringConverter());
        registry.addConverter(getIdToMensajeConverter());
        registry.addConverter(getStringToMensajeConverter());
        registry.addConverter(getPMToStringConverter());
        registry.addConverter(getIdToPMConverter());
        registry.addConverter(getStringToPMConverter());
        registry.addConverter(getRolToStringConverter());
        registry.addConverter(getIdToRolConverter());
        registry.addConverter(getStringToRolConverter());
        registry.addConverter(getTagToStringConverter());
        registry.addConverter(getIdToTagConverter());
        registry.addConverter(getStringToTagConverter());
        registry.addConverter(getTweetToStringConverter());
        registry.addConverter(getIdToTweetConverter());
        registry.addConverter(getStringToTweetConverter());
        registry.addConverter(getUsuarioToStringConverter());
        registry.addConverter(getIdToUsuarioConverter());
        registry.addConverter(getStringToUsuarioConverter());
        registry.addConverter(getValidacionToStringConverter());
        registry.addConverter(getIdToValidacionConverter());
        registry.addConverter(getStringToValidacionConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
