package ar.com.bubble.web;
import ar.com.bubble.domain.Tweet;
import ar.com.bubble.domain.Usuario;
import ar.com.bubble.domain.Validacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/tweets")
@Controller
@RooWebScaffold(path = "tweets", formBackingObject = Tweet.class)
@RooWebJson(jsonObject = Tweet.class)
public class TweetController {
	
	
	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
            Tweet tweet = Tweet.fromJsonToTweet(json);
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String userName = auth.getName();
            
            List<Validacion> val = new ArrayList<Validacion>();
            TypedQuery tqVal = Validacion.findValidacionsByUserEquals(userName);
            if(tqVal != null){
            	val = tqVal.getResultList();
            }
            List<Usuario> autor = new ArrayList<Usuario>();
            TypedQuery tqAutor = Usuario.findUsuariosByUserData(val.get(0));
            if(tqAutor != null){
            	
            	autor = tqAutor.getResultList();
            	            	
            }
            tweet.setAutor(autor.get(0));
            
            tweet.persist();
            RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
            headers.add("Location",uriBuilder.path(a.value()[0]+"/"+tweet.getId().toString()).build().toUriString());
            return new ResponseEntity<String>(headers, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
	
	
	
}
