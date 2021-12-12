package util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.mail.HtmlEmail;


/**
 * 	发送邮件工具类
 * 	用到的jar包（commons-email-1.5.jar、activation.jar、mail.jar、freemarker.jar、spring-context-support-3.2.4.RELEASE.jar）
 */
public class SendMailUtil{

    //发送邮箱地址
    private  String from = "microsoftkodbox@126.com";
    //发送人
    private  String fromName = "书店";
    //用户名
    private  String username = "microsoftkodbox@126.com";
    //密码
    private  String password = "JQWJVEWQOZBNWRPL";
    //编码格式
    private  String charSet = "utf-8";

    /**
     * 构造方法
     * @param from
     * @param fromName
     * @param username
     * @param password
     * @param charSet
     */
    public SendMailUtil(String from,String fromName,String username,String password,String charSet) {
        this.from = from;
        this.fromName = fromName;
        this.username = username;
        this.password = password;
        this.charSet = charSet;
    }


    private static Map<String, String> hostMap = new HashMap<String, String>();
    static {
        // 126
        hostMap.put("smtp.126", "smtp.126.com");

        // qq
        hostMap.put("smtp.qq", "smtp.qq.com");

        // 163
        hostMap.put("smtp.163", "smtp.163.com");

        // sina
        hostMap.put("smtp.sina", "smtp.sina.com.cn");

        // tom
        hostMap.put("smtp.tom", "smtp.tom.com");

        // 263
        hostMap.put("smtp.263", "smtp.263.net");

        // yahoo
        hostMap.put("smtp.yahoo", "smtp.mail.yahoo.com");

        // hotmail
        hostMap.put("smtp.hotmail", "smtp.live.com");

        // gmail
        hostMap.put("smtp.gmail", "smtp.gmail.com");
        hostMap.put("smtp.port.gmail", "465");

        hostMap.put("smtp.trht", "smtp.exmail.qq.com");
    }

    /**
     * 	获取邮箱服务器
     * @param email 邮箱地址
     * @return
     * @throws Exception
     */
    public static String getHost(String email) throws Exception {
        Pattern pattern = Pattern.compile("\\w+@(\\w+)(\\.\\w+){1,2}");
        Matcher matcher = pattern.matcher(email);
        String key = "unSupportEmail";
        if (matcher.find()) {
            key = "smtp." + matcher.group(1);
        }
        if (hostMap.containsKey(key)) {
            return hostMap.get(key);
        } else {
            throw new Exception("unSupportEmail");
        }
    }

    /**
     * 	获取邮箱发送端口
     * @param email
     * @return
     * @throws Exception
     */
    public static int getSmtpPort(String email) throws Exception {
        Pattern pattern = Pattern.compile("\\w+@(\\w+)(\\.\\w+){1,2}");
        Matcher matcher = pattern.matcher(email);
        String key = "unSupportEmail";
        if (matcher.find()) {
            key = "smtp.port." + matcher.group(1);
        }
        if (hostMap.containsKey(key)) {
            return Integer.parseInt(hostMap.get(key));
        } else {
            return 25;
        }
    }

    /**
     * 发送普通邮件
     * @param toMailAddr 收信人地址
     * @param subject email主题
     * @param message 发送email信息
     */
    public void sendCommonMail(String toMailAddr, String subject, String message) {
        HtmlEmail hemail = new HtmlEmail();
        try {
            hemail.setHostName(getHost(from));
            hemail.setSmtpPort(getSmtpPort(from));
            hemail.setCharset(charSet);
            hemail.addTo(toMailAddr);
            hemail.setFrom(from, fromName);
            hemail.setAuthentication(username, password);
            hemail.setSubject(subject);
            hemail.setMsg(message);
            hemail.send();
            System.out.println("email send true!");
        } catch (Exception e) {
            System.out.println("email send error!" + e.getMessage());
        }

    }

    /**
     * 	测试方法
     * @param args
     */
//    public static void main(String[] args) {
//        try {
//
//            SendMailUtil smu = new SendMailUtil("microsoftkodbox@126.com","test","microsoftkodbox@126.com","JQWJVEWQOZBNWRPL","UTF-8");
//            //测试发送普通邮件
//            smu.sendCommonMail("1138251341@qq.com", "验证码", "测试普通邮件测试普通邮件测试普通邮件测试普通邮件测试普通邮件测试普通邮件测试普通邮件");
//            //测试通过模板发送邮件
//            System.out.println("email send true!");
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("email send error!");
//        }
//    }
}
