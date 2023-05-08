package miniprojet.miniprojetbo.Service;

import miniprojet.miniprojetbo.DAO.HibernateDAO;
import miniprojet.miniprojetbo.Model.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

@Service
public class ArticleService {
    @Autowired
    HibernateDAO dao;

    public int LoginAdmin(String mail, String mdp){
        int i = dao.LoginAdmin(mail, mdp);
        return i;
    }

    public void AddArticle(String titre, String contenu, Timestamp datepublication) throws Exception{
        dao.AddArticle(titre, contenu, datepublication);
    }

    public List<Article> AllArticle(){
        List<Article> liste = dao.findAll(Article.class);
        return liste;
    }
    public void UpdateArticle(String titre, String contenu, Timestamp datepublication, int id){
        dao.UpdateArticle(titre, contenu, datepublication, id);
    }

    public List<Article> ArticleById(int id){
        List<Article> liste = (Collections.singletonList(dao.findById(Article.class, id)));
        return liste;
    }

    public void DeleteById(int id){
        dao.deleteById(Article.class, id);
    }

    public List<Article> Recheche(String mot){
        Article article = new Article();
        List<Article> liste = dao.recherche(article, mot);
        return liste;
    }

    public int LastIdArticle(String titre){
        int i = dao.LastIdArticle(titre);
        return i;
    }

    public void AddActualite(String annonce,int idarticle ) throws Exception{
        dao.AddActualite(annonce, idarticle);
    }
}
