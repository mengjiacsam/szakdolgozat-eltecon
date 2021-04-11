install.packages("ggplot2")
install.packages("rlang")
library(data.table)
library(ggplot2)
library(RColorBrewer)
library(interplot)
require(ggthemes)



data_saving<- fread("C:/Users/Csaa/Documents/R_megtakaritas_predik.csv")        
data_saving$isocode_c <- as.factor(data_saving$isocode)


data_saving_melt <- melt(data_saving, id.vars = c(1:3,5:10,13))
ggplot(data = data_saving_melt, aes(x = isocode_c, y= value, 
                                    group=1, color=variable))+
  geom_point()+
  geom_smooth(data = data_saving_melt[data_saving_melt$variable=="Saving_1"],
              method = "lm", se=F)+
  geom_smooth(data = data_saving_melt[data_saving_melt$variable=="Saving_2_w_int"],
              method = "lm", se=F)+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1, size = 7),
        axis.text.y = element_text(size = 7),
        legend.title = element_text(size =8),
        legend.text = element_text(size=8),
        plot.title = element_text(size = 12, face = "bold"))+
  xlab('Országok (ISO kód szerint)') + 
  ylab("Megtakarítás")+
  labs(title = "Megtakarítás két predikciójának alakulása országos szinten", color="Jelmagyarázat")+
  scale_color_manual(values = c("#999999",  "magenta", "navy"),
                     labels=c("Saving"="Megtakarítás","Saving_1"="Megtakarítás_predikciója_1",
                              "Saving_2_w_int"="Megtakarítás_predikciója_2"))










  ## interakciós tag ábra SZAR!!!
model1 <- lm(Saving ~ patience * Accounts, data=data_1)
interplot(m=model1, var1 = "patience", var2 = "Accounts")+xlab("Accounts")+
  ylab("Estimated Coefficienct for Patience")+ 
  ggtitle("Estimated Coefficient for Patinence on Saving by level of Financial inclusion")+
  theme_few()
