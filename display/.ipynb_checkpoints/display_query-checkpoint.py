from time import time


def select_all_query(table_name: str):
    query = f"""SELECT * FROM {table_name} LIMIT 10;"""
    return query


def display_results(table_column_names: list, results: list, exec_time):
    table_columns_length = [len(x) for x in table_column_names]
    for result in results:
        for value in range(len(result)):
            row_data = result[value]
            if row_data:
                row_data = str(row_data)
                if len(row_data) > table_columns_length[value]:
                    table_columns_length[value] = len(row_data)
    plus_dashes = ""
    for num in range(len(table_columns_length)):
        plus_dashes = plus_dashes + "+" + '-'*(table_columns_length[num]+2)
    plus_dashes = plus_dashes + "+"
    
    print(plus_dashes)
    
    table_headers = ""
    for num in range(len(table_column_names)):
        table_headers = table_headers + f"| {table_column_names[num]:^{table_columns_length[num]}} "
    table_headers = table_headers + "|"
    print(table_headers)
    
    print(plus_dashes)
    
    for result in results:
        table_row = ""
        for value in range(len(result)):
            row_data = result[value]
            if row_data is None:
                row_data = "NULL"            
            table_row = table_row + "|" + f"{str(row_data):^{table_columns_length[value]+2}}"
        print(table_row + "|")
    print(plus_dashes)
    num_rows: int = len(results)
    message: str = "row returned" if num_rows == 1 else "rows returned"
    print(f"{num_rows} {message} in time: ({exec_time} sec)")
    print("\n")

def execute_display_query_results(query: str, cursor_object, logger = None):
    if logger:
        logger.info(f"Executing the query: {query}")
    init_time = time()
    cursor_object.execute(query)
    end_time = time()
    exec_time = end_time - init_time
    results = cursor_object.fetchall()    
    table_column_names = cursor_object.column_names  
    display_results(table_column_names, results, round(exec_time, 3))