package ar.com.bubble.web;
import ar.com.bubble.domain.Mensaje;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mensajes")
@Controller
@RooWebScaffold(path = "mensajes", formBackingObject = Mensaje.class)
public class MensajeController {
}
