Plant_Control_Data <- read.csv("~/Documents/FIU/Research/JapBeetle_Temp_Herbivory/Data/No_Choice_Assays/Plant_Control_Data.csv")

box.elder <- subset(Plant_Control_Data, Plant=='Box Elder')
be.mod <- lm(Change~PreMass, box.elder)

red.maple <- subset(Plant_Control_Data, Plant=='Red Maple')
rm.mod <- lm(Change~PreMass, red.maple[-15,]) # Remove observation where petiole was not in water

sweetgum <- subset(Plant_Control_Data, Plant=='Sweetgum')
sg.mod <- lm(Change~PreMass, sweetgum[-8,]) # Remove observation where petiole was not in water

syc <- subset(Plant_Control_Data, Plant=='Sycamore')
syc.mod <- lm(Change~PreMass, syc)

rosa <- subset(Plant_Control_Data, Plant=='Multiflora Rose')
rosa.mod <- lm(Change~PreMass, rosa)

b.berry <- subset(Plant_Control_Data, Plant=='Blackberry')
bberry.mod <- lm(Change~PreMass, b.berry)

w.berry <- subset(Plant_Control_Data, Plant=='Wineberry')
wberry.mod <- lm(Change~PreMass, w.berry)

vib <- subset(Plant_Control_Data, Plant=='V. prunifolium')
vib.mod <- lm(Change~PreMass, vib)

vit <- subset(Plant_Control_Data, Plant=='Frost Grape')
vit.mod <- lm(Change~PreMass, vit)

plot(Change~PreMass, vit)