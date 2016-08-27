package ar.com.bubble.web;
import ar.com.bubble.domain.Validacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/validacions")
@Controller
@RooWebScaffold(path = "validacions", formBackingObject = Validacion.class)
public class ValidacionController {
}
