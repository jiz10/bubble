// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.web;

import ar.com.bubble.domain.Tag;
import ar.com.bubble.domain.Tweet;
import ar.com.bubble.domain.Usuario;
import ar.com.bubble.web.TweetController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TweetController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TweetController.create(@Valid Tweet tweet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tweet);
            return "tweets/create";
        }
        uiModel.asMap().clear();
        tweet.persist();
        return "redirect:/tweets/" + encodeUrlPathSegment(tweet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TweetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Tweet());
        return "tweets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TweetController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tweet", Tweet.findTweet(id));
        uiModel.addAttribute("itemId", id);
        return "tweets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TweetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tweets", Tweet.findTweetEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Tweet.countTweets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tweets", Tweet.findAllTweets(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "tweets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TweetController.update(@Valid Tweet tweet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, tweet);
            return "tweets/update";
        }
        uiModel.asMap().clear();
        tweet.merge();
        return "redirect:/tweets/" + encodeUrlPathSegment(tweet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TweetController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Tweet.findTweet(id));
        return "tweets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TweetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Tweet tweet = Tweet.findTweet(id);
        tweet.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tweets";
    }
    
    void TweetController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("tweet_createdat_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void TweetController.populateEditForm(Model uiModel, Tweet tweet) {
        uiModel.addAttribute("tweet", tweet);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("tags", Tag.findAllTags());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String TweetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
