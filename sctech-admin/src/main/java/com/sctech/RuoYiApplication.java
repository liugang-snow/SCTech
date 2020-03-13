package com.sctech;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
		/*
		 * System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
		 * " .-------.       ____     __        \n" +
		 * " |  _ _   \\      \\   \\   /  /    \n" +
		 * " | ( ' )  |       \\  _. /  '       \n" +
		 * " |(_ o _) /        _( )_ .'         \n" +
		 * " | (_,_).' __  ___(_ o _)'          \n" +
		 * " |  |\\ \\  |  ||   |(_,_)'         \n" +
		 * " |  | \\ `'   /|   `-'  /           \n" +
		 * " |  |  \\    /  \\      /           \n" +
		 * " ''-'   `'-'    `-..-'              ");
		 */
        
        System.out.println( " ┏┛┻━━━━━┛┻┓            	\n" +
					        " ┃　　　　　　   ┃				\n" +
					        " ┃　　　━　　    ┃				\n" +
					        " ┃　┳┛　  ┗┳　 ┃				\n" +
					        " ┃　　　　　　   ┃				\n" +
					        " ┃　　　┻　　    ┃				\n" +
					        " ┃　　　　　　   ┃				\n" +
					        " ┗━┓　　　┏━━┛				\n" +
					        "   ┃　　　┃   神兽保佑			\n" +
					        "   ┃　　　┃   项目启动成功！		\n" +
					        "   ┃　　　┗━━━━━━━━━━┓		\n" +
					        "   ┃　　　　　　　                 ┣┓		\n" +
					        "   ┃　　　　                             ┏┛		\n" +
					        "   ┗━┓ ┓ ┏━━━┳ ┓ ┏━┛		\n" +
					        "     ┃ ┫ ┫   ┃ ┫ ┫			\n" +
					        "     ┗━┻━┛   ┗━┻━┛			");

    }
}