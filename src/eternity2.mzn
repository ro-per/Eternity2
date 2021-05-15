% --------------------------- Constants ---------------------------
% Data File
int: H;
int: W;
int: N=H*W;
array[1..N, 1..4] of var 0..N: Pieces;

% --------------------------- Decision Variables ---------------------------
array[1..H, 1..W] of var 1..N: loc_grid;
array[1..H, 1..W] of var 0..3: rot_grid;

% --------------------------- Constraints ---------------------------
% NO REPEATED PIECES
constraint
    forall(Ax in 1..W, Ay in 1..H, Bx in 1..W,  By in 1..H)(
        if (Ay != By) \/ (Ax != Bx)
        then loc_grid[Ay,Ax] != loc_grid[By,Bx]
        endif
    );  


% ALL GREY ON THE BORDER
% LOWER BORDER
constraint
    forall(x in 1..W)(
        Pieces[
            loc_grid[H,x],
            ((4-rot_grid[H,x]+4) mod 4)+1
        ] = 0
    );
% UPPER BORDER
constraint
    forall(x in 1..W)(
        Pieces[
            loc_grid[1,x],
            ((4-rot_grid[1,x]+2) mod 4)+1
        ] = 0
    );

% LEFT BORDER
constraint
    forall(y in 1..H)(
        Pieces[
            loc_grid[y,1],
            ((4-rot_grid[y,1]+1) mod 4)+1
        ] = 0
    );
% RIGHT BORDER
constraint
    forall(y in 1..H)(
        Pieces[
            loc_grid[y,W],
            ((4-rot_grid[y,W]+3) mod 4)+1
        ] = 0
    );

% THERE CAN BE NO GREY IN THE MIDDLE (Kind of duplicate to "all grey on the border")
constraint
    forall(x in 2..W-1,y in 2..H-1, side in 1..4)(
        Pieces[
            loc_grid[y,x],
            ((4-rot_grid[y,W]+side) mod 4)+1
        ] != 0
    );


      
% ADJECENT EDGES EQUAL  (Only right and lower are necessary)
% RIGHT-LEFT
constraint
    forall(x in 1..W-1,y in 1..H)(
        % RIGHT SIDE 
        Pieces[
            loc_grid[y,x],
            ((4-rot_grid[y,x]+3) mod 4)+1
        ]
        %must match
        =
        % LEFT SIDE 
        Pieces[
            loc_grid[y,x+1],
            ((4-rot_grid[y,x+1]+1) mod 4)+1
        ]
    ); 
% UPPER-LOWER
constraint
    forall(x in 1..W,y in 1..H-1)(
        % RIGHT SIDE 
        Pieces[
            loc_grid[y,x],
            ((4-rot_grid[y,x]+4) mod 4)+1
        ]
        %must match
        =
        % LEFT SIDE 
        Pieces[
            loc_grid[y+1,x],
            ((4-rot_grid[y+1,x]+2) mod 4)+1
        ]
    );                                                                          
% --------------------------- Objective Function ---------------------------
solve satisfy; %find any solution

% --------------------------- Desired Output ---------------------------
output[   
        % PRINT ID
        show_int(1, loc_grid[i,j]-1)
        % ADD SPACE
        ++ " "
        % PRINT ID
        ++ show_int(1, rot_grid[i,j])
        % PRINT END LINE 
        ++ "\n"
        % FOR ... VALUES i & j
        |i in 1..H, j in 1..W
    ]; 
output["\n"];


% % --------------------------- Output ID's on Board ---------------------------
% output["ID's:\n"];
% output[   
%         % PRINT ID
%         show_int(3, loc_grid[i,j]) 
%         % CONCAT
%             ++
%         % PRINT END LINE 
%         if j == W 
%         then "\n" 
%         else " " 
%         endif
%         % FOR ... VALUES i & j
%         |i in 1..H, j in 1..W
%     ]; 
% output["\n"];

% % --------------------------- Output Rotations on Board ---------------------------
% output["Rotations:\n"];
% output[   
%         % PRINT ID
%         show_int(3, rot_grid[i,j]) 
%         % CONCAT
%         ++
%         % PRINT END LINE 
%         if j == W 
%         then "\n" 
%         else " " 
%         endif
%         % FOR ... VALUES i & j
%         |i in 1..H, j in 1..W
%     ]; 
% output["\n"];