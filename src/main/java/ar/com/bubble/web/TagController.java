package ar.com.bubble.web;
import ar.com.bubble.domain.Tag;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tags")
@Controller
@RooWebScaffold(path = "tags", formBackingObject = Tag.class)
public class TagController {
}
