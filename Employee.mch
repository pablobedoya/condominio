/* Employee
 * Author: 
 * Creation date: 25/05/2016
 */
MACHINE Employee
SETS NAME; ROLES = {permition, no_permition}
VARIABLES employees
INVARIANT employees : NAME --> ROLES
INITIALISATION employees := NAME * {no_permition}
OPERATIONS
    add_emp(name) =
    PRE name : NAME & employees(name) : {no_permition}
    THEN employees := employees <+ {name |-> permition}
    END;
    
    remove_emp(name) =
    PRE name : NAME & employees(name) : {permition}
    THEN employees := employees <+ {name |-> no_permition}
    END;
    
    change_role(name, new_role) =
    PRE name : NAME & new_role : ROLES & employees(name) /= new_role
    THEN employees := employees <+ {name |-> new_role}
    END

END
