# Crowdfunding_ETL
 
# Extraction

Data was extracted from the two provided Excel files: crowdfunding.xlsx and contacts.xlsx.

The extraction was performed using the pd.read_excel python method and the resulting data was loaded into a Pandas DataFrame crowdfunding_info_df

The starter code contained an error for the contacts.xlsx. The starter code for importing the file had header = 2 when in fact the header began on line 4. Therefore the correct code was header = 3.

# Transformation: Category and Subcategory

## Column Splitting: Category and Subcategory

In the crowdfunding_info_df dataframe, category and subcategory were combined into a single column named "category & sub-category". This column was split into two columns using the / delimiter with the .str.split method. This was done in place. The original "category & sub-category" was maintained in the updated dataframe.

.head method was used to verify the changes

## Creates Lists of  Unique Categories and Subcategories

In the crowdfunding_inf0_df, two new lists were created. First, there a list was created with the list of unique categories using the .unique method. This list was assigned the variable name "categories".

Next, using the same .unique method, a list of unique subcategories was created and assigned the variable name "subcategories".
    
    
## Adding Category and Subcategory IDs

The number of distinct values for each list was determined using the built in Python len() function. This would be used to determine the number of IDs needed for each list.

Using the .range method from the numpy module, lists were created containing the values from 1 to the length of the list. For categories the list contained numbers 1 through 9, inclusive, and assigned the variable cat_ids. For subcategories, the list was from 1 through 24, inclusive and assigned the variable scat_ids.

## Renaming the IDS

List comprehensives were used to rename the categories and subcategories with the cat and subcat prefix respectively. The built in Python print fuction was used to confirm the correct result.

## Create the Dataframes

A category dataframe was created using the pd.DataFrame method creating columns for cat_ids and categories. The resulting DataFrame was assigned the category_df variable.

The subcategory dataframe was created using the same method and assigned the subcategory_df variable.

Each DataFrame was reviewed to confirm the DataFrames were correct.

Both DataFrames were exported to .csv files for use in the database creation.

# Transformation: Campaign

## Copying the crowdfunding_info_df DataFrame.

The crowdfunding_info_df was copied to a new DataFrame and and assigned to the campaign.df variable.

## Renaming Columns 
    
Using the starter_files as reference, three columns were renamed using the .rename method:
1. blurb was renamed description
2. launched_at was renamed launch_date
3. deadline was renamed end_date

The .head method was used to confirm successful renaming.

## Conversion to Float

Two variables were converted to a float type variable using the .astype method. The variables were goal and pledged. Conversion was confirmed using the .info() method.

## Date Formatting

The "launch_date" and "end_date" variables were converted using .to_datetime to reformat from unix time to a calendar date. .dt.date was used to remove the time element from the result.

.head() was used to confirm the update.

## Merge with Category and Subcategory DataFrames.

The previously created category_df and subcategory_df were merged with the campaign_df using .merge method. The category_df was merged on the category column and the sub_category_df was merged on the  sub_category column.

## Dropping Unwanted Columns

Using the starter_files as reference the following columns were dropped:

1. staff_pick
2. spotlight
3. category & subcategory

The .head() method was used to confirm.

## The resulting DataFrame was exported to a .csv for use in database creation.

# Transformation: Contacts

## Dictionary Creation

Using a for loop, the .iterrows method, json.loads method, and .append method, each row of the imported contact_info_df was converted to a dictionary. The results were stored in the dict_values variable.

## Conversion to DataFrame

The contents of the dict_values variable were converted to a DataFrame with renamed columns matching the starter code:

1. contact_id
2. name
3. email

The resulting DataFrame was assigned to the variable contact_info_df. The .head() method was used to confirm.

## Split the Name Column

The name column was of the contact_info_df DataFrame was split into a first name column and a last name column using a space as the delimiter in the str.split method.

This was done in place.

## Drop Columns

The starter code instructed to drop the contact_name column which based on the previous starter code did not exist, it was the name column. The name column was dropped to conform with the starter code output.

The .head() method was used to confirm the result.

## Columns Reordered

The columns were reordered and saved in a new variable contacts_df_clean.

## The final DataFrame was exported to a .csv file for database creation.

# Load into Database

pgAdmin was used to create a PostgreSQL database named crowdfunding_db.

# Table Analysis

The csv were imported into Excel using GET AND TRANFORM (aka Power Query)
Once imported, they were added to the Excel data model and viewed using the Power Pivot diagram view.
The diagram view allowed review of each column of each table.
The data was then viewed in the Power Pivot data view. This allowed a review of the data type in each column
The preliminary ERD was created using the Excel Power Pivot diagram view.
This view was used to determine the order in which the tables needed to be created.

## Order of Table Creation

The order in which the table were created was detemined by the relationships among them.
If a table referenced a foreign key, the table containing the foreign key was created first.

### Table Creation
Tables were created in the following order based on their relationships:
1. **category**
2. **subcategory** 
3. **contacts**
4. **campaign** (referenced columns in all the previous tables as foreign keys)

Data was imported into the tables from the prevously created .csv files using PostgreSQL import functionality.

There was an issue where the number of characters required and datatypes for certain fields.  This was corrected using ALTER COLUMN. 

    





    



        

