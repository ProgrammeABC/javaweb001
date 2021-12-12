package model;

import util.SendMailUtil;
import java.util.Random;


public class SendMailService{
    public String SendMail(String userMail,String username){
        String code;
        String sources = "0123456789ABCDEFGHIJKMLMNOPQRSTUVWXYZ"; // 加上一些字母，就可以生成pc站的验证码了
        Random rand = new Random();
        StringBuffer flag = new StringBuffer();
        for (int j = 0; j < 6; j++) {
            flag.append(sources.charAt(rand.nextInt(9)) + "");
        }
        code = flag.toString();
        SendMailUtil smus = new SendMailUtil("microsoftkodbox@126.com","XHBookShop","microsoftkodbox@126.com","JQWJVEWQOZBNWRPL","UTF-8");
        smus.sendCommonMail(userMail,"XHBookShop账户安全码","尊敬的用户："+username+"您好！您的账户安全验证码为："+code+"。");
        return code;
    }
}
