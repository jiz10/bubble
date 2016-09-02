// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.com.bubble.web;

import ar.com.bubble.domain.Validacion;
import ar.com.bubble.web.ValidacionController;
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

privileged aspect ValidacionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ValidacionController.create(@Valid Validacion validacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, validacion);
            return "validacions/create";
        }
        uiModel.asMap().clear();
        validacion.persist();
        return "redirect:/validacions/" + encodeUrlPathSegment(validacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ValidacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Validacion());
        return "validacions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ValidacionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("validacion", Validacion.findValidacion(id));
        uiModel.addAttribute("itemId", id);
        return "validacions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ValidacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("validacions", Validacion.findValidacionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Validacion.countValidacions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("validacions", Validacion.findAllValidacions(sortFieldName, sortOrder));
        }
        return "validacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ValidacionController.update(@Valid Validacion validacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, validacion);
            return "validacions/update";
        }
        uiModel.asMap().clear();
        validacion.merge();
        return "redirect:/validacions/" + encodeUrlPathSegment(validacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ValidacionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Validacion.findValidacion(id));
        return "validacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ValidacionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Validacion validacion = Validacion.findValidacion(id);
        validacion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/validacions";
    }
    
    void ValidacionController.populateEditForm(Model uiModel, Validacion validacion) {
        uiModel.addAttribute("validacion", validacion);
    }
    
    String ValidacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
