package ar.com.bubble.web;
import ar.com.bubble.domain.PM;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/pms")
@Controller
@RooWebScaffold(path = "pms", formBackingObject = PM.class)
@RooWebJson(jsonObject = PM.class)
public class PMController {
}
