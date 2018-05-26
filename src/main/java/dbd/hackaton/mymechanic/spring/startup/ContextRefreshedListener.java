package dbd.hackaton.mymechanic.spring.startup;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class ContextRefreshedListener implements ApplicationListener<ContextRefreshedEvent> {

	Logger logger = LoggerFactory.getLogger(ContextRefreshedListener.class);

	@Autowired
	private ApplicationContext appContext;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		
//		SpringApplication.exit(appContext, new ExitCodeGenerator() {
//			
//			@Override
//			public int getExitCode() {
//				return 0;
//			}
//		});
	}

}
