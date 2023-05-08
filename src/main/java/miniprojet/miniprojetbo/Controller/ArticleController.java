package miniprojet.miniprojetbo.Controller;

import miniprojet.miniprojetbo.Model.Article;
import miniprojet.miniprojetbo.Service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class ArticleController {
    @Autowired
    ArticleService articleService;

    @GetMapping("AddArticle")
    private ModelAndView PageArticle() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Add/Article");
        return modelAndView;
    }

    @PostMapping("NouveauArticle")
    private Object NouveauSociete(@RequestParam("titre") String titre, @RequestParam("contenu") String contenu, @RequestParam("daty") String date) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        try {
            if (titre != "" || contenu != "" || date != "") {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime time = LocalDateTime.parse(date, formatter);
                Instant instant = time.atZone(ZoneId.systemDefault()).toInstant();
                Timestamp datePublication = Timestamp.from(instant);
                articleService.AddArticle(titre, contenu, datePublication);
                articleService.AddActualite("Une nouvelle information concernant <strong>"+titre+"</strong> ",articleService.LastIdArticle(titre));
                modelAndView.setViewName("Add/Article");
                modelAndView.addObject("erreur", "Ajouté avec succès.");
            }
            return modelAndView;

        } catch (Exception e) {
            modelAndView.setViewName("Add/Article");
            modelAndView.addObject("erreur", "Completez tous les champs et inserez des valeurs exactes");
        }
        return modelAndView;
    }

    @GetMapping("PageListArticle")
    private ModelAndView ListArticle() {
        ModelAndView modelAndView = new ModelAndView();
        try {
            List<Article> liste = articleService.AllArticle();
            modelAndView.setViewName("List/ArticleList");
            modelAndView.addObject("liste", liste);
        } catch (Exception e) {
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message", e.getMessage());
        }
        return modelAndView;
    }

    @GetMapping("PageModification")
    private ModelAndView PageModification(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        List<Article> liste = articleService.ArticleById(id);
        modelAndView.setViewName("Add/UpdateArticle");
        modelAndView.addObject("liste", liste);
        return modelAndView;
    }

    @PostMapping("ModifierArticle")
    private ModelAndView ModifierArticle(@RequestParam("titre") String titre, @RequestParam("contenu") String contenu, @RequestParam("daty") String date, @RequestParam("id") int id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        try {
            if (titre != "" || contenu != "" || date != "") {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime time = LocalDateTime.parse(date, formatter);
                Instant instant = time.atZone(ZoneId.systemDefault()).toInstant();
                Timestamp datePublication = Timestamp.from(instant);
                articleService.UpdateArticle(titre, contenu, datePublication,id);
                modelAndView.setViewName("redirect:/PageListArticle");
            } else {
                modelAndView.setViewName("redirect:/PageModification");
                modelAndView.addObject("id",id);
                modelAndView.addObject("erreur", "Completez tous les champs et inserez des valeurs exactes");
            }
            return modelAndView;

        } catch (Exception e) {
            modelAndView.setViewName("List/ArticleList");
            modelAndView.addObject("erreur", "Erreur de modification");
        }
        return modelAndView;
    }

    @GetMapping("DeleteArticle")
    private ModelAndView DeleteArticle(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
            articleService.DeleteById(id);
            modelAndView.setViewName("redirect:/PageListArticle");
        return modelAndView;
    }
    @GetMapping("/search")
    public ModelAndView Recherche(@RequestParam("search") String sr){
        ModelAndView modelAndView = new ModelAndView();
        try{
            List<Article> liste = articleService.Recheche(sr);
            modelAndView.setViewName("List/RechercheArticle");
            modelAndView.addObject("liste", liste);
        }catch (Exception e) {
            modelAndView.setViewName("Exception/Exception");
            modelAndView.addObject("message", e.getMessage());
        }
        return modelAndView;
    }
}
