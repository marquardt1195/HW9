library(xgboost)
library(tidyverse)
install.packages("DiagrammeR")
library(DiagrammeR)

y = as.numeric(iris$Species) - 1


x <- select(iris, -Species)
var.names = names(x)
x <- as.matrix(x)

param <- list(
  "objective" = "multi:softprob",
  "eval_metric" = "mlogloss",
  "num_class" = length(table(y)),
  "eta" = 0.05,
  "max_depth" = 7,
  "lambda" = 1,
  "alpha" = .8,
  "min_child_weight" = 3,
  "subsample" = .9,
  "colsample_bytree" = .6
)

cv.nround = 250

bst.cv <- xgb.cv(params = param, 
                 data = x, 
                 label = y,
                 nfold = 5, 
                 nrounds = cv.nround,
                 missing = NA, 
                 prediction = TRUE
)

nround <- which(bst.cv$evaluation_log$test_mlogloss_mean == min(bst.cv$evaluation_log$test_mlogloss_mean))

ggplot(bst.cv$evaluation_log, aes(x = iter)) +
  geom_line(aes(y = train_mlogloss_mean), color = "blue") +
  geom_line(aes(y = test_mlogloss_mean), color = 'red') +
  geom_vline(xintercept = nround, linetype = 3)



IrisClassifier <- xgboost(params = param, 
                          data = x, 
                          label = y,
                          nrounds = nround, 
                          missing = NA)

xgb.importance(feature_names = var.names, model = IrisClassifier)

xgboost::xgb.plot.tree(IrisClassifier, feature_names = var.names, n_first_trees = 3)
xgb.plot.deepness(IrisClassifier)


XX <- xgb.model.dt.tree(var.names, IrisClassifier)

p <- predict(IrisClassifier, x)

PredictorMatrix <- matrix(p, ncol = length(table(y)), byrow = TRUE)

write.csv(PredictorMatrix, 'PredictorMatrix.csv')