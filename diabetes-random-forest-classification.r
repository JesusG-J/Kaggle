{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "24f9d4a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:20.214066Z",
     "iopub.status.busy": "2023-07-01T18:58:20.211864Z",
     "iopub.status.idle": "2023-07-01T18:58:20.652272Z",
     "shell.execute_reply": "2023-07-01T18:58:20.650337Z"
    },
    "papermill": {
     "duration": 0.450794,
     "end_time": "2023-07-01T18:58:20.654900",
     "exception": false,
     "start_time": "2023-07-01T18:58:20.204106",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "data <- read.csv('/kaggle/input/diabetes-prediction-dataset/diabetes_prediction_dataset.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "4f48f7f4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:20.704411Z",
     "iopub.status.busy": "2023-07-01T18:58:20.665604Z",
     "iopub.status.idle": "2023-07-01T18:58:20.797410Z",
     "shell.execute_reply": "2023-07-01T18:58:20.795279Z"
    },
    "papermill": {
     "duration": 0.142589,
     "end_time": "2023-07-01T18:58:20.802098",
     "exception": false,
     "start_time": "2023-07-01T18:58:20.659509",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>gender</th><th scope=col>age</th><th scope=col>hypertension</th><th scope=col>heart_disease</th><th scope=col>smoking_history</th><th scope=col>bmi</th><th scope=col>HbA1c_level</th><th scope=col>blood_glucose_level</th><th scope=col>diabetes</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Female</td><td>80</td><td>0</td><td>1</td><td>never  </td><td>25.19</td><td>6.6</td><td>140</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>Female</td><td>54</td><td>0</td><td>0</td><td>No Info</td><td>27.32</td><td>6.6</td><td> 80</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>Male  </td><td>28</td><td>0</td><td>0</td><td>never  </td><td>27.32</td><td>5.7</td><td>158</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>Female</td><td>36</td><td>0</td><td>0</td><td>current</td><td>23.45</td><td>5.0</td><td>155</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>Male  </td><td>76</td><td>1</td><td>1</td><td>current</td><td>20.14</td><td>4.8</td><td>155</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Female</td><td>20</td><td>0</td><td>0</td><td>never  </td><td>27.32</td><td>6.6</td><td> 85</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & gender & age & hypertension & heart\\_disease & smoking\\_history & bmi & HbA1c\\_level & blood\\_glucose\\_level & diabetes\\\\\n",
       "  & <chr> & <dbl> & <int> & <int> & <chr> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & Female & 80 & 0 & 1 & never   & 25.19 & 6.6 & 140 & 0\\\\\n",
       "\t2 & Female & 54 & 0 & 0 & No Info & 27.32 & 6.6 &  80 & 0\\\\\n",
       "\t3 & Male   & 28 & 0 & 0 & never   & 27.32 & 5.7 & 158 & 0\\\\\n",
       "\t4 & Female & 36 & 0 & 0 & current & 23.45 & 5.0 & 155 & 0\\\\\n",
       "\t5 & Male   & 76 & 1 & 1 & current & 20.14 & 4.8 & 155 & 0\\\\\n",
       "\t6 & Female & 20 & 0 & 0 & never   & 27.32 & 6.6 &  85 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | gender &lt;chr&gt; | age &lt;dbl&gt; | hypertension &lt;int&gt; | heart_disease &lt;int&gt; | smoking_history &lt;chr&gt; | bmi &lt;dbl&gt; | HbA1c_level &lt;dbl&gt; | blood_glucose_level &lt;int&gt; | diabetes &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | Female | 80 | 0 | 1 | never   | 25.19 | 6.6 | 140 | 0 |\n",
       "| 2 | Female | 54 | 0 | 0 | No Info | 27.32 | 6.6 |  80 | 0 |\n",
       "| 3 | Male   | 28 | 0 | 0 | never   | 27.32 | 5.7 | 158 | 0 |\n",
       "| 4 | Female | 36 | 0 | 0 | current | 23.45 | 5.0 | 155 | 0 |\n",
       "| 5 | Male   | 76 | 1 | 1 | current | 20.14 | 4.8 | 155 | 0 |\n",
       "| 6 | Female | 20 | 0 | 0 | never   | 27.32 | 6.6 |  85 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  gender age hypertension heart_disease smoking_history bmi   HbA1c_level\n",
       "1 Female 80  0            1             never           25.19 6.6        \n",
       "2 Female 54  0            0             No Info         27.32 6.6        \n",
       "3 Male   28  0            0             never           27.32 5.7        \n",
       "4 Female 36  0            0             current         23.45 5.0        \n",
       "5 Male   76  1            1             current         20.14 4.8        \n",
       "6 Female 20  0            0             never           27.32 6.6        \n",
       "  blood_glucose_level diabetes\n",
       "1 140                 0       \n",
       "2  80                 0       \n",
       "3 158                 0       \n",
       "4 155                 0       \n",
       "5 155                 0       \n",
       "6  85                 0       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "    gender               age         hypertension     heart_disease    \n",
       " Length:100000      Min.   : 0.08   Min.   :0.00000   Min.   :0.00000  \n",
       " Class :character   1st Qu.:24.00   1st Qu.:0.00000   1st Qu.:0.00000  \n",
       " Mode  :character   Median :43.00   Median :0.00000   Median :0.00000  \n",
       "                    Mean   :41.89   Mean   :0.07485   Mean   :0.03942  \n",
       "                    3rd Qu.:60.00   3rd Qu.:0.00000   3rd Qu.:0.00000  \n",
       "                    Max.   :80.00   Max.   :1.00000   Max.   :1.00000  \n",
       " smoking_history         bmi         HbA1c_level    blood_glucose_level\n",
       " Length:100000      Min.   :10.01   Min.   :3.500   Min.   : 80.0      \n",
       " Class :character   1st Qu.:23.63   1st Qu.:4.800   1st Qu.:100.0      \n",
       " Mode  :character   Median :27.32   Median :5.800   Median :140.0      \n",
       "                    Mean   :27.32   Mean   :5.528   Mean   :138.1      \n",
       "                    3rd Qu.:29.58   3rd Qu.:6.200   3rd Qu.:159.0      \n",
       "                    Max.   :95.69   Max.   :9.000   Max.   :300.0      \n",
       "    diabetes    \n",
       " Min.   :0.000  \n",
       " 1st Qu.:0.000  \n",
       " Median :0.000  \n",
       " Mean   :0.085  \n",
       " 3rd Qu.:0.000  \n",
       " Max.   :1.000  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t100000 obs. of  9 variables:\n",
      " $ gender             : chr  \"Female\" \"Female\" \"Male\" \"Female\" ...\n",
      " $ age                : num  80 54 28 36 76 20 44 79 42 32 ...\n",
      " $ hypertension       : int  0 0 0 0 1 0 0 0 0 0 ...\n",
      " $ heart_disease      : int  1 0 0 0 1 0 0 0 0 0 ...\n",
      " $ smoking_history    : chr  \"never\" \"No Info\" \"never\" \"current\" ...\n",
      " $ bmi                : num  25.2 27.3 27.3 23.4 20.1 ...\n",
      " $ HbA1c_level        : num  6.6 6.6 5.7 5 4.8 6.6 6.5 5.7 4.8 5 ...\n",
      " $ blood_glucose_level: int  140 80 158 155 155 85 200 85 145 100 ...\n",
      " $ diabetes           : int  0 0 0 0 0 0 1 0 0 0 ...\n"
     ]
    }
   ],
   "source": [
    "head(data)\n",
    "summary(data)\n",
    "str(data)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "5f92b30e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:20.816117Z",
     "iopub.status.busy": "2023-07-01T18:58:20.814494Z",
     "iopub.status.idle": "2023-07-01T18:58:20.845698Z",
     "shell.execute_reply": "2023-07-01T18:58:20.838691Z"
    },
    "papermill": {
     "duration": 0.041104,
     "end_time": "2023-07-01T18:58:20.848485",
     "exception": false,
     "start_time": "2023-07-01T18:58:20.807381",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "any(is.na(data))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8b06401f",
   "metadata": {
    "papermill": {
     "duration": 0.005081,
     "end_time": "2023-07-01T18:58:20.858953",
     "exception": false,
     "start_time": "2023-07-01T18:58:20.853872",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**TRAIN AND TEST SPLIT**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "29064cf2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:20.872790Z",
     "iopub.status.busy": "2023-07-01T18:58:20.871179Z",
     "iopub.status.idle": "2023-07-01T18:58:20.900207Z",
     "shell.execute_reply": "2023-07-01T18:58:20.898190Z"
    },
    "papermill": {
     "duration": 0.038771,
     "end_time": "2023-07-01T18:58:20.902842",
     "exception": false,
     "start_time": "2023-07-01T18:58:20.864071",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t100000 obs. of  9 variables:\n",
      " $ gender             : chr  \"Female\" \"Female\" \"Male\" \"Female\" ...\n",
      " $ age                : num  80 54 28 36 76 20 44 79 42 32 ...\n",
      " $ hypertension       : int  0 0 0 0 1 0 0 0 0 0 ...\n",
      " $ heart_disease      : int  1 0 0 0 1 0 0 0 0 0 ...\n",
      " $ smoking_history    : chr  \"never\" \"No Info\" \"never\" \"current\" ...\n",
      " $ bmi                : num  25.2 27.3 27.3 23.4 20.1 ...\n",
      " $ HbA1c_level        : num  6.6 6.6 5.7 5 4.8 6.6 6.5 5.7 4.8 5 ...\n",
      " $ blood_glucose_level: int  140 80 158 155 155 85 200 85 145 100 ...\n",
      " $ diabetes           : Factor w/ 2 levels \"0\",\"1\": 1 1 1 1 1 1 2 1 1 1 ...\n"
     ]
    }
   ],
   "source": [
    "data$diabetes <- factor(data$diabetes)\n",
    "str(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "8f4b8af4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:20.917057Z",
     "iopub.status.busy": "2023-07-01T18:58:20.915491Z",
     "iopub.status.idle": "2023-07-01T18:58:21.068479Z",
     "shell.execute_reply": "2023-07-01T18:58:21.066450Z"
    },
    "papermill": {
     "duration": 0.16305,
     "end_time": "2023-07-01T18:58:21.071149",
     "exception": false,
     "start_time": "2023-07-01T18:58:20.908099",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(caTools)\n",
    "set.seed(101)\n",
    "split <- sample.split(data$diabetes, SplitRatio = 0.7)\n",
    "train <- subset(data , split == T)\n",
    "test <- subset(data, split == F)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "574ba95b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:21.085519Z",
     "iopub.status.busy": "2023-07-01T18:58:21.083922Z",
     "iopub.status.idle": "2023-07-01T18:58:21.159462Z",
     "shell.execute_reply": "2023-07-01T18:58:21.157144Z"
    },
    "papermill": {
     "duration": 0.085996,
     "end_time": "2023-07-01T18:58:21.162571",
     "exception": false,
     "start_time": "2023-07-01T18:58:21.076575",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>gender</th><th scope=col>age</th><th scope=col>hypertension</th><th scope=col>heart_disease</th><th scope=col>smoking_history</th><th scope=col>bmi</th><th scope=col>HbA1c_level</th><th scope=col>blood_glucose_level</th><th scope=col>diabetes</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Female</td><td>80</td><td>0</td><td>1</td><td>never  </td><td>25.19</td><td>6.6</td><td>140</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>Female</td><td>54</td><td>0</td><td>0</td><td>No Info</td><td>27.32</td><td>6.6</td><td> 80</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>Female</td><td>36</td><td>0</td><td>0</td><td>current</td><td>23.45</td><td>5.0</td><td>155</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>Male  </td><td>76</td><td>1</td><td>1</td><td>current</td><td>20.14</td><td>4.8</td><td>155</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Female</td><td>20</td><td>0</td><td>0</td><td>never  </td><td>27.32</td><td>6.6</td><td> 85</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>Female</td><td>44</td><td>0</td><td>0</td><td>never  </td><td>19.31</td><td>6.5</td><td>200</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & gender & age & hypertension & heart\\_disease & smoking\\_history & bmi & HbA1c\\_level & blood\\_glucose\\_level & diabetes\\\\\n",
       "  & <chr> & <dbl> & <int> & <int> & <chr> & <dbl> & <dbl> & <int> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & Female & 80 & 0 & 1 & never   & 25.19 & 6.6 & 140 & 0\\\\\n",
       "\t2 & Female & 54 & 0 & 0 & No Info & 27.32 & 6.6 &  80 & 0\\\\\n",
       "\t4 & Female & 36 & 0 & 0 & current & 23.45 & 5.0 & 155 & 0\\\\\n",
       "\t5 & Male   & 76 & 1 & 1 & current & 20.14 & 4.8 & 155 & 0\\\\\n",
       "\t6 & Female & 20 & 0 & 0 & never   & 27.32 & 6.6 &  85 & 0\\\\\n",
       "\t7 & Female & 44 & 0 & 0 & never   & 19.31 & 6.5 & 200 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | gender &lt;chr&gt; | age &lt;dbl&gt; | hypertension &lt;int&gt; | heart_disease &lt;int&gt; | smoking_history &lt;chr&gt; | bmi &lt;dbl&gt; | HbA1c_level &lt;dbl&gt; | blood_glucose_level &lt;int&gt; | diabetes &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | Female | 80 | 0 | 1 | never   | 25.19 | 6.6 | 140 | 0 |\n",
       "| 2 | Female | 54 | 0 | 0 | No Info | 27.32 | 6.6 |  80 | 0 |\n",
       "| 4 | Female | 36 | 0 | 0 | current | 23.45 | 5.0 | 155 | 0 |\n",
       "| 5 | Male   | 76 | 1 | 1 | current | 20.14 | 4.8 | 155 | 0 |\n",
       "| 6 | Female | 20 | 0 | 0 | never   | 27.32 | 6.6 |  85 | 0 |\n",
       "| 7 | Female | 44 | 0 | 0 | never   | 19.31 | 6.5 | 200 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  gender age hypertension heart_disease smoking_history bmi   HbA1c_level\n",
       "1 Female 80  0            1             never           25.19 6.6        \n",
       "2 Female 54  0            0             No Info         27.32 6.6        \n",
       "4 Female 36  0            0             current         23.45 5.0        \n",
       "5 Male   76  1            1             current         20.14 4.8        \n",
       "6 Female 20  0            0             never           27.32 6.6        \n",
       "7 Female 44  0            0             never           19.31 6.5        \n",
       "  blood_glucose_level diabetes\n",
       "1 140                 0       \n",
       "2  80                 0       \n",
       "4 155                 0       \n",
       "5 155                 0       \n",
       "6  85                 0       \n",
       "7 200                 1       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>70000</li><li>9</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 70000\n",
       "\\item 9\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 70000\n",
       "2. 9\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 70000     9"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>gender</th><th scope=col>age</th><th scope=col>hypertension</th><th scope=col>heart_disease</th><th scope=col>smoking_history</th><th scope=col>bmi</th><th scope=col>HbA1c_level</th><th scope=col>blood_glucose_level</th><th scope=col>diabetes</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>3</th><td>Male  </td><td>28</td><td>0</td><td>0</td><td>never  </td><td>27.32</td><td>5.7</td><td>158</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>Female</td><td>54</td><td>0</td><td>0</td><td>former </td><td>54.70</td><td>6.0</td><td>100</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>13</th><td>Female</td><td>78</td><td>0</td><td>0</td><td>former </td><td>36.05</td><td>5.0</td><td>130</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>14</th><td>Female</td><td>67</td><td>0</td><td>0</td><td>never  </td><td>25.69</td><td>5.8</td><td>200</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>Female</td><td>76</td><td>0</td><td>0</td><td>No Info</td><td>27.32</td><td>5.0</td><td>160</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>Female</td><td>42</td><td>0</td><td>0</td><td>never  </td><td>24.48</td><td>5.7</td><td>158</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & gender & age & hypertension & heart\\_disease & smoking\\_history & bmi & HbA1c\\_level & blood\\_glucose\\_level & diabetes\\\\\n",
       "  & <chr> & <dbl> & <int> & <int> & <chr> & <dbl> & <dbl> & <int> & <fct>\\\\\n",
       "\\hline\n",
       "\t3 & Male   & 28 & 0 & 0 & never   & 27.32 & 5.7 & 158 & 0\\\\\n",
       "\t12 & Female & 54 & 0 & 0 & former  & 54.70 & 6.0 & 100 & 0\\\\\n",
       "\t13 & Female & 78 & 0 & 0 & former  & 36.05 & 5.0 & 130 & 0\\\\\n",
       "\t14 & Female & 67 & 0 & 0 & never   & 25.69 & 5.8 & 200 & 0\\\\\n",
       "\t15 & Female & 76 & 0 & 0 & No Info & 27.32 & 5.0 & 160 & 0\\\\\n",
       "\t18 & Female & 42 & 0 & 0 & never   & 24.48 & 5.7 & 158 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | gender &lt;chr&gt; | age &lt;dbl&gt; | hypertension &lt;int&gt; | heart_disease &lt;int&gt; | smoking_history &lt;chr&gt; | bmi &lt;dbl&gt; | HbA1c_level &lt;dbl&gt; | blood_glucose_level &lt;int&gt; | diabetes &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 3 | Male   | 28 | 0 | 0 | never   | 27.32 | 5.7 | 158 | 0 |\n",
       "| 12 | Female | 54 | 0 | 0 | former  | 54.70 | 6.0 | 100 | 0 |\n",
       "| 13 | Female | 78 | 0 | 0 | former  | 36.05 | 5.0 | 130 | 0 |\n",
       "| 14 | Female | 67 | 0 | 0 | never   | 25.69 | 5.8 | 200 | 0 |\n",
       "| 15 | Female | 76 | 0 | 0 | No Info | 27.32 | 5.0 | 160 | 0 |\n",
       "| 18 | Female | 42 | 0 | 0 | never   | 24.48 | 5.7 | 158 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "   gender age hypertension heart_disease smoking_history bmi   HbA1c_level\n",
       "3  Male   28  0            0             never           27.32 5.7        \n",
       "12 Female 54  0            0             former          54.70 6.0        \n",
       "13 Female 78  0            0             former          36.05 5.0        \n",
       "14 Female 67  0            0             never           25.69 5.8        \n",
       "15 Female 76  0            0             No Info         27.32 5.0        \n",
       "18 Female 42  0            0             never           24.48 5.7        \n",
       "   blood_glucose_level diabetes\n",
       "3  158                 0       \n",
       "12 100                 0       \n",
       "13 130                 0       \n",
       "14 200                 0       \n",
       "15 160                 0       \n",
       "18 158                 0       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>30000</li><li>9</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 30000\n",
       "\\item 9\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 30000\n",
       "2. 9\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 30000     9"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'gender'</li><li>'age'</li><li>'hypertension'</li><li>'heart_disease'</li><li>'smoking_history'</li><li>'bmi'</li><li>'HbA1c_level'</li><li>'blood_glucose_level'</li><li>'diabetes'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'gender'\n",
       "\\item 'age'\n",
       "\\item 'hypertension'\n",
       "\\item 'heart\\_disease'\n",
       "\\item 'smoking\\_history'\n",
       "\\item 'bmi'\n",
       "\\item 'HbA1c\\_level'\n",
       "\\item 'blood\\_glucose\\_level'\n",
       "\\item 'diabetes'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'gender'\n",
       "2. 'age'\n",
       "3. 'hypertension'\n",
       "4. 'heart_disease'\n",
       "5. 'smoking_history'\n",
       "6. 'bmi'\n",
       "7. 'HbA1c_level'\n",
       "8. 'blood_glucose_level'\n",
       "9. 'diabetes'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"gender\"              \"age\"                 \"hypertension\"       \n",
       "[4] \"heart_disease\"       \"smoking_history\"     \"bmi\"                \n",
       "[7] \"HbA1c_level\"         \"blood_glucose_level\" \"diabetes\"           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(train)\n",
    "dim(train)\n",
    "head(test)\n",
    "dim(test)\n",
    "colnames(data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "db4cb77a",
   "metadata": {
    "papermill": {
     "duration": 0.007961,
     "end_time": "2023-07-01T18:58:21.177061",
     "exception": false,
     "start_time": "2023-07-01T18:58:21.169100",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**BUILDING THE RANDOM FOREST MODEL**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "ef7f7e03",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:58:21.193799Z",
     "iopub.status.busy": "2023-07-01T18:58:21.192202Z",
     "iopub.status.idle": "2023-07-01T18:59:37.344147Z",
     "shell.execute_reply": "2023-07-01T18:59:37.342091Z"
    },
    "papermill": {
     "duration": 76.163824,
     "end_time": "2023-07-01T18:59:37.347455",
     "exception": false,
     "start_time": "2023-07-01T18:58:21.183631",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "randomForest 4.6-14\n",
      "\n",
      "Type rfNews() to see new features/changes/bug fixes.\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(randomForest)\n",
    "rf.model <- randomForest(diabetes ~ ., data = train, importance=T)\n",
    "rf.predicted.values <- predict(rf.model, test)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "0c67db71",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:59:37.367340Z",
     "iopub.status.busy": "2023-07-01T18:59:37.365735Z",
     "iopub.status.idle": "2023-07-01T18:59:37.384788Z",
     "shell.execute_reply": "2023-07-01T18:59:37.382961Z"
    },
    "papermill": {
     "duration": 0.031403,
     "end_time": "2023-07-01T18:59:37.387468",
     "exception": false,
     "start_time": "2023-07-01T18:59:37.356065",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "                   \n",
       "rf.predicted.values     0     1\n",
       "                  0 27445   839\n",
       "                  1     5  1711"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(rf.predicted.values, test$diabetes)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1defd332",
   "metadata": {
    "papermill": {
     "duration": 0.006924,
     "end_time": "2023-07-01T18:59:37.401466",
     "exception": false,
     "start_time": "2023-07-01T18:59:37.394542",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**RATES**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "daee7706",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:59:37.419528Z",
     "iopub.status.busy": "2023-07-01T18:59:37.417872Z",
     "iopub.status.idle": "2023-07-01T18:59:37.445368Z",
     "shell.execute_reply": "2023-07-01T18:59:37.443512Z"
    },
    "papermill": {
     "duration": 0.039664,
     "end_time": "2023-07-01T18:59:37.448155",
     "exception": false,
     "start_time": "2023-07-01T18:59:37.408491",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.972"
      ],
      "text/latex": [
       "0.972"
      ],
      "text/markdown": [
       "0.972"
      ],
      "text/plain": [
       "[1] 0.972"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.028"
      ],
      "text/latex": [
       "0.028"
      ],
      "text/markdown": [
       "0.028"
      ],
      "text/plain": [
       "[1] 0.028"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "accuracy <- (1715+27445)/(27445+835+5+1715)\n",
    "accuracy # 0.972\n",
    "##\n",
    "misc.rate <- (835 + 5)/(27445+835+5+1715)\n",
    "misc.rate # 0.028"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "7d4de96f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-01T18:59:37.466866Z",
     "iopub.status.busy": "2023-07-01T18:59:37.465128Z",
     "iopub.status.idle": "2023-07-01T18:59:37.598103Z",
     "shell.execute_reply": "2023-07-01T18:59:37.490554Z"
    },
    "papermill": {
     "duration": 0.145372,
     "end_time": "2023-07-01T18:59:37.600966",
     "exception": false,
     "start_time": "2023-07-01T18:59:37.455594",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 8 × 4 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>0</th><th scope=col>1</th><th scope=col>MeanDecreaseAccuracy</th><th scope=col>MeanDecreaseGini</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>gender</th><td> 3.924937e-04</td><td>0.0002347284</td><td>0.0003795529</td><td>  49.13645</td></tr>\n",
       "\t<tr><th scope=row>age</th><td> 6.627904e-04</td><td>0.0139381591</td><td>0.0017915342</td><td> 612.90394</td></tr>\n",
       "\t<tr><th scope=row>hypertension</th><td> 6.069479e-04</td><td>0.0037675916</td><td>0.0008754309</td><td> 134.83191</td></tr>\n",
       "\t<tr><th scope=row>heart_disease</th><td> 6.964755e-04</td><td>0.0036347233</td><td>0.0009463622</td><td> 109.53018</td></tr>\n",
       "\t<tr><th scope=row>smoking_history</th><td>-5.755578e-05</td><td>0.0020022932</td><td>0.0001171941</td><td> 155.10601</td></tr>\n",
       "\t<tr><th scope=row>bmi</th><td> 5.463511e-04</td><td>0.0098693948</td><td>0.0013390263</td><td> 653.26914</td></tr>\n",
       "\t<tr><th scope=row>HbA1c_level</th><td> 3.477725e-02</td><td>0.2719170621</td><td>0.0549156591</td><td>3851.38965</td></tr>\n",
       "\t<tr><th scope=row>blood_glucose_level</th><td> 2.886806e-02</td><td>0.2091283980</td><td>0.0441774362</td><td>3194.45999</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 8 × 4 of type dbl\n",
       "\\begin{tabular}{r|llll}\n",
       "  & 0 & 1 & MeanDecreaseAccuracy & MeanDecreaseGini\\\\\n",
       "\\hline\n",
       "\tgender &  3.924937e-04 & 0.0002347284 & 0.0003795529 &   49.13645\\\\\n",
       "\tage &  6.627904e-04 & 0.0139381591 & 0.0017915342 &  612.90394\\\\\n",
       "\thypertension &  6.069479e-04 & 0.0037675916 & 0.0008754309 &  134.83191\\\\\n",
       "\theart\\_disease &  6.964755e-04 & 0.0036347233 & 0.0009463622 &  109.53018\\\\\n",
       "\tsmoking\\_history & -5.755578e-05 & 0.0020022932 & 0.0001171941 &  155.10601\\\\\n",
       "\tbmi &  5.463511e-04 & 0.0098693948 & 0.0013390263 &  653.26914\\\\\n",
       "\tHbA1c\\_level &  3.477725e-02 & 0.2719170621 & 0.0549156591 & 3851.38965\\\\\n",
       "\tblood\\_glucose\\_level &  2.886806e-02 & 0.2091283980 & 0.0441774362 & 3194.45999\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 8 × 4 of type dbl\n",
       "\n",
       "| <!--/--> | 0 | 1 | MeanDecreaseAccuracy | MeanDecreaseGini |\n",
       "|---|---|---|---|---|\n",
       "| gender |  3.924937e-04 | 0.0002347284 | 0.0003795529 |   49.13645 |\n",
       "| age |  6.627904e-04 | 0.0139381591 | 0.0017915342 |  612.90394 |\n",
       "| hypertension |  6.069479e-04 | 0.0037675916 | 0.0008754309 |  134.83191 |\n",
       "| heart_disease |  6.964755e-04 | 0.0036347233 | 0.0009463622 |  109.53018 |\n",
       "| smoking_history | -5.755578e-05 | 0.0020022932 | 0.0001171941 |  155.10601 |\n",
       "| bmi |  5.463511e-04 | 0.0098693948 | 0.0013390263 |  653.26914 |\n",
       "| HbA1c_level |  3.477725e-02 | 0.2719170621 | 0.0549156591 | 3851.38965 |\n",
       "| blood_glucose_level |  2.886806e-02 | 0.2091283980 | 0.0441774362 | 3194.45999 |\n",
       "\n"
      ],
      "text/plain": [
       "                    0             1            MeanDecreaseAccuracy\n",
       "gender               3.924937e-04 0.0002347284 0.0003795529        \n",
       "age                  6.627904e-04 0.0139381591 0.0017915342        \n",
       "hypertension         6.069479e-04 0.0037675916 0.0008754309        \n",
       "heart_disease        6.964755e-04 0.0036347233 0.0009463622        \n",
       "smoking_history     -5.755578e-05 0.0020022932 0.0001171941        \n",
       "bmi                  5.463511e-04 0.0098693948 0.0013390263        \n",
       "HbA1c_level          3.477725e-02 0.2719170621 0.0549156591        \n",
       "blood_glucose_level  2.886806e-02 0.2091283980 0.0441774362        \n",
       "                    MeanDecreaseGini\n",
       "gender                49.13645      \n",
       "age                  612.90394      \n",
       "hypertension         134.83191      \n",
       "heart_disease        109.53018      \n",
       "smoking_history      155.10601      \n",
       "bmi                  653.26914      \n",
       "HbA1c_level         3851.38965      \n",
       "blood_glucose_level 3194.45999      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "rf.model$importance"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 81.219859,
   "end_time": "2023-07-01T18:59:37.931872",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-01T18:58:16.712013",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
