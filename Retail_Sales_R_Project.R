# Install Required Library

install.packages("readr")
install.packages("dplyr")


# Run Library
library(readr)
library(dplyr)

#Import Data
data<- read.csv("C:/Users/Admin1/Desktop/Utkarsh/Retail_Sales.csv")
View(data)

head(data,5)
tail(data,5)
str(data)
summary(data)

#No of columns and rows
dim(data)

#Columns Name
colnames(data)

#Check Missing values
colSums(is.na(data))

# Check duplicate data
sum(duplicated(data))

# Convert 
str(data$Order_Date)
data$Order_Date <- as.Date(data$Order_Date, format="%d-%m-%Y")


#1.Total_Sales 
total_sales <- sum(data$Total_Sales_INR)
total_sales

#2.Average Sales
avg_sales <- mean(data$Total_Sales_INR)
avg_sales

#3.Maximum Sales
max_sale <- max(data$Total_Sales_INR)
max_sale

#4.minimum Sale 
min_sale <-  min(data$Total_Sales_INR)
min_sale

#5. Total Orders
total_orders <- nrow(data)
total_orders

#6. Total Quantity sold
total_qnt <- sum(data$Quantity)
total_qnt


# 1. Category wise sales analysis
category_sales <- data %>% group_by(Category) %>% summarise(Total_Sales=sum(Total_Sales_INR),Total_Orders=n(),Avg_Sales=mean(Total_Sales_INR)) %>% arrange(desc(Total_Sales))
category_sales

# 2. Region wise sales 
region_sales <- data %>% group_by(Region) %>% summarise(Total_Sales=sum(Total_Sales_INR), Total_Orders=n()) %>% arrange(desc(total_sales))
region_sales

# 3. Top 10 selling products
top_products <- data %>% group_by(Product) %>% summarise(Total_Quantity=sum(Quantity),Total_Revenue=sum(Total_Sales_INR))%>% arrange(desc(Total_Quantity))%>% head(10)
top_products

## Visualisation 
# 1. Category wise Sales
ggplot(category_sales,aes(x=Category,y=Total_Sales))+geom_col()+labs(title="Category wise Sales",x="Category",y="Total Sales(INR)")+theme_minimal()


#2. Region wise Sales
ggplot(region_sales,aes(x=Region,y=Total_Sales))+geom_col()+coord_flip()+labs(title ="Region wise Sales", x="Region",y="Total Sales(INR)")+theme_minimal()


#3. Payment Mode wise analysis

payment_sale <- data %>% group_by(Payment_Mode)%>% summarise(Total_Sales=sum(Total_Sales_INR))%>% arrange(desc(Total_Sales))
payment_sale

ggplot(payment_sale,aes(x=Payment_Mode,y=Total_Sales))+geom_col()+labs(title="Sales by Payment Mode")+theme_minimal()


## Monthly Sales Analysis
monthly_sales <- data%>% mutate(Month=floor_date(Order_Date,"month"))%>% group_by(Month)%>% summarise(Total_Sales=sum(Total_Sales_INR))
monthly_sales

ggplot(monthly_sales,aes(x=Month,y=Total_Sales))+geom_line(color="green",linewidth = 3)+geom_point()+labs(title = "Monthly Sales Trend",x="Month", y="Sales(INR)")+theme_minimal()

View(data)

data$Sale_Status <- ifelse(data$Total_Sales_INR>5000, "High Sales", "Normal Sales")
View(data)
