package ar.com.bubble.web;
import ar.com.bubble.domain.Rol;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/rols")
@Controller
@RooWebScaffold(path = "rols", formBackingObject = Rol.class)
public class RolController {
}
