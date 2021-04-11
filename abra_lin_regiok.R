# első lépések

library(data.table)
library(ggplot2)
library(RColorBrewer)
library(interplot)
require(ggthemes)
data <- fread("C:/Users/Csaa/Documents/szakdoga_új/R-hez táblázít/bizalomnelkuli.csv")
data <- fread("C:/Users/Csaa/Documents/szakdoga_új/R-hez táblázít/mindennel.csv")
# Lineáris regressziós ábrák
# Megtakarítás és türelem

ggplot(data, aes(patience,Saving, colour= Region))+ 
  geom_point()+ 
  xlab("Türelem")+ 
  ylab("Megtakarítás")+
  labs(title = "Megtakarítás és türelem régiók szerint", color="Jelmagyarázat")+
  theme(axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        plot.title = element_text(size = 12, face = "bold"),
        legend.title = element_text(size = 7),
        legend.text = element_text(size = 7))+
  stat_smooth(method="lm", se=FALSE, color='black')+
  scale_color_manual(values = c("#999999",  "magenta", "navy", "deeppink","lawngreen", "yellow","turquoise1"),
                     labels=c("East Asia & Pacific"="Kelet-Ázsia és Csendes-óceáni térség",
                              "Europe & Central Asia"="Európa és Eurázsia",
                              "Latin America & Caribbean"="Dél-Amerika",
                              "Middle East & North Africa"="Közel-Kelet és Észak-Afrika",
                              "North America"="Észak-Amerika",
                              "South Asia"="Dél-Ázsia",
                              "Sub-Saharan Africa"="Szubszaharai Afrika"))


# Megtakarítás és pénzügyi beilleszkedés

ggplot(data, aes(Accounts,Saving, colour= Region)) + 
  geom_point() + 
  xlab('Pénzügyi beilleszkés') + 
  ylab("Megtakarítás") +
  labs(title = "Megtakarítás és pénzügyi beilleszkedés régiók szerint", color="Jelmagyarázat")+
  theme(axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        plot.title = element_text(size = 12, face = "bold"),
        legend.title = element_text(size = 7),
        legend.text = element_text(size = 7))+
  stat_smooth(method="lm", se=FALSE, color='black')+
  scale_color_manual(values = c("#999999",  "magenta", "navy", "deeppink","lawngreen", "yellow","turquoise1"),
                     labels=c("East Asia & Pacific"="Kelet-Ázsia és Csendes-óceáni térség",
                              "Europe & Central Asia"="Európa és Eurázsia",
                              "Latin America & Caribbean"="Dél-Amerika",
                              "Middle East & North Africa"="Közel-Kelet és Észak-Afrika",
                              "North America"="Észak-Amerika",
                              "South Asia"="Dél-Ázsia",
                              "Sub-Saharan Africa"="Szubszaharai Afrika"))

