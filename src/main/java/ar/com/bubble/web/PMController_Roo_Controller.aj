// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.web;

import ar.com.bubble.domain.PM;
import ar.com.bubble.domain.Usuario;
import ar.com.bubble.web.PMController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PMController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PMController.create(@Valid PM PM_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, PM_);
            return "pms/create";
        }
        uiModel.asMap().clear();
        PM_.persist();
        return "redirect:/pms/" + encodeUrlPathSegment(PM_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PMController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PM());
        return "pms/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PMController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("pm_", PM.findPM(id));
        uiModel.addAttribute("itemId", id);
        return "pms/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PMController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("pms", PM.findPMEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) PM.countPMS() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pms", PM.findAllPMS(sortFieldName, sortOrder));
        }
        return "pms/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PMController.update(@Valid PM PM_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, PM_);
            return "pms/update";
        }
        uiModel.asMap().clear();
        PM_.merge();
        return "redirect:/pms/" + encodeUrlPathSegment(PM_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PMController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, PM.findPM(id));
        return "pms/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PMController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PM PM_ = PM.findPM(id);
        PM_.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pms";
    }
    
    void PMController.populateEditForm(Model uiModel, PM PM_) {
        uiModel.addAttribute("PM_", PM_);
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String PMController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
