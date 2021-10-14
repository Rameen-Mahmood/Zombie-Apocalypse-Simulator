function  [neighbours_ind] = find_neighbours(row_ind, col_ind, matrix_size)
    number_of_rows = matrix_size(1);
    number_of_columns = matrix_size(2);
  
    
    if row_ind == 1
        if col_ind == 1
            neighbours_ind = [
                row_ind, col_ind + 1; 
                row_ind + 1, col_ind; row_ind + 1, col_ind + 1];
        elseif col_ind == number_of_columns
            neighbours_ind = [
                row_ind, col_ind - 1; 
                row_ind + 1, col_ind - 1; row_ind + 1, col_ind];
        else
            neighbours_ind = [
                row_ind, col_ind - 1; row_ind, col_ind + 1; 
                row_ind + 1, col_ind - 1; row_ind + 1, col_ind; row_ind + 1, col_ind + 1];
        end
    elseif row_ind == number_of_rows
        if col_ind == 1
            neighbours_ind = [
                row_ind - 1, col_ind; row_ind - 1, col_ind + 1; 
                row_ind, col_ind + 1];
        elseif col_ind == number_of_columns
            neighbours_ind = [
                row_ind - 1, col_ind - 1; row_ind - 1, col_ind; 
                row_ind, col_ind - 1];
        else
            neighbours_ind = [
                row_ind - 1, col_ind - 1; row_ind - 1, col_ind; row_ind - 1, col_ind + 1; 
                row_ind, col_ind - 1; row_ind, col_ind + 1];
        end
    else
        if col_ind == 1
            neighbours_ind = [
                row_ind - 1, col_ind; row_ind - 1, col_ind + 1;
                row_ind, col_ind + 1; 
                row_ind + 1, col_ind; row_ind + 1, col_ind + 1];
        elseif col_ind == number_of_columns
            neighbours_ind = [
                row_ind - 1, col_ind - 1; row_ind - 1, col_ind; 
                row_ind, col_ind - 1;
                row_ind + 1, col_ind - 1; row_ind + 1, col_ind];
        else
            neighbours_ind = [
                row_ind - 1, col_ind - 1; row_ind - 1, col_ind; row_ind - 1, col_ind + 1;
                row_ind, col_ind - 1; row_ind, col_ind + 1;
                row_ind + 1, col_ind - 1; row_ind + 1, col_ind; row_ind + 1, col_ind + 1];
        end
    end
end

