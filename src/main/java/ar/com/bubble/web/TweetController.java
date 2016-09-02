package ar.com.bubble.web;
import ar.com.bubble.domain.Tweet;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/tweets")
@Controller
@RooWebScaffold(path = "tweets", formBackingObject = Tweet.class)
@RooWebJson(jsonObject = Tweet.class)
public class TweetController {
}
