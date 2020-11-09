%% MERGE TESTING IMAGES
clear all;close all;clc;

y = 1280;
x = 720;
mergeImg = zeros(x,y,3);
row = 1;
col = 1;

numdx = 7;
numdy = 4;
imgSize = size(mergeImg);
dx = 165
dy = 176

imgSave = [];
numPerImg = 1;

numVis = 1;

for imgNum = 1:28
    pathData = sprintf("D:/Python_3.6/[2020_7]CNN_wildfire/Bigimage/saveCrop2/");
    cd(pathData)
    try
        imgName = sprintf('crop%g.jpg',imgNum);
        img = imread(imgName);
        img = uint8(img);
        disp('Damage');
        if numPerImg <= 28
            imgSave = [imgSave; img];
            numPerImg = numPerImg +1;
        else
            imgSave = [];
            numPerImg = 1;
            numVis = 1;
            imgName = sprintf('crop%g.jpg',imgNum);
            img = imread(imgName);
            img = uint8(img);
            disp('Damage');
            imgSave = [imgSave; img];
            numPerImg = numPerImg +1;
        end
    catch
        disp('No Damage');
    end
    imgShow = 1;
 
    if numVis == 28
%         figure('Position',[3000 100 3648 5472]);
        k = 1;
        rowRun = 1;
        
        v = VideoWriter('A45.avi');
        open(v);
        
        for row = 1:dx:497
            for col = 1:dy:1057
                mergeImg(row:row+dx+59-1,col:col+dy+48-1,:) = imgSave(rowRun:(dx+59)*k,:,:);
                
                k = k+1;
                rowRun = rowRun + dx+59;
                mergeImg2 = uint8(mergeImg);
                imshow(mergeImg2);
                %rectangle('Position',[4*176 0 4*176+224 224],'EdgeColor','R','LineWidth',2,'FaceColor', [0 .5 .5] );
          
%              

                axis on
                title(sprintf('Testing croped image: %g',imgShow))
                imgShow = imgShow +1;
                drawnow

                save_gif = "D:/Matlab/Video";
                cd(save_gif)
                frame = getframe(gcf);
                writeVideo(v,frame);
                drawnow
            end
        end
        k = 1;
        A = [ ]; 
        % A = softmax result from the cropped images, softmax result should
        % be list and the model is should be connected with Matlab.
        % Without connection, A [] should be writtend like this. (Example)
       A = ["0.000" "0.000" "0.397" "1.000" "1.000" "0.069" "0.000" "0.000" "0.000" "0.000" "1.000" "0.999" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000" "0.000"];

        for row = 1:dx:497
            for col = 1:dy:1057


                if mod(k,7)==1
                text(col+112, row+112, A(k),'FontSize',22,'Color','white','HorizontalAlignment','center')
                elseif mod(k,7) ==2
                text(col+112, row+112, A(k),'FontSize',22,'Color','c','HorizontalAlignment','center')
                elseif mod(k,7) ==3
                text(col+112, row+112, A(k),'FontSize',22,'Color','white','HorizontalAlignment','center')
                elseif mod(k,7) ==4
                text(col+112, row+112, A(k),'FontSize',22,'Color','c','HorizontalAlignment','center')
                elseif mod(k,7) ==5
                text(col+112, row+112, A(k),'FontSize',22,'Color','white','HorizontalAlignment','center')
                elseif mod(k,7) ==6
                text(col+112, row+112, A(k),'FontSize',22,'Color','c','HorizontalAlignment','center')
                elseif mod(k,7) ==0
                text(col+112, row+112, A(k),'FontSize',22,'Color','white','HorizontalAlignment','center')                
                end
                k = k+1;
                if col == 1
                   rectangle('Position',[2*col row dy+48-1 dx+59-1],'EdgeColor','w','LineWidth',2);
                   
                elseif col == 177
                    rectangle('Position',[2*col-176 row dy+48-1 dx+59-1],'EdgeColor','c','LineWidth',2);
                elseif col == 353
                    rectangle('Position',[col row dy+48-1 dx+59-1],'EdgeColor','w','LineWidth',2);
                 elseif col == 529
                    rectangle('Position',[col row dy+48-1 dx+59-1],'EdgeColor','c','LineWidth',2);    
                 elseif col == 705
                    rectangle('Position',[col row dy+48-1 dx+59-1],'EdgeColor','w','LineWidth',2);
                 elseif col == 881
                    rectangle('Position',[col row dy+48-1 dx+59-1],'EdgeColor','c','LineWidth',2);
                 elseif col == 1057
                    rectangle('Position',[col row dy+48-1 dx+59-1],'EdgeColor','w','LineWidth',2);
                end
                if k ==29
        	    % A = softmax result from the cropped images, softmax result should
        	    % be list and the model is should be connected with Matlab.
       	    % Without connection, rectangle can be writtend like this. (Example)
                rectangle('Position',[176*3,0,224,224],'FaceColor',[1 0 0 0.3],'EdgeColor','none')
                rectangle('Position',[176*4,0,224,224],'FaceColor',[1 0 0 0.3],'EdgeColor','none')
                rectangle('Position',[176*3,165,224,224],'FaceColor',[1 0 0 0.3],'EdgeColor','none')
                rectangle('Position',[176*4,165,224,224],'FaceColor',[1 0 0 0.3],'EdgeColor','none')
                
                
                end
                
                
                save_gif = "D:/Matlab/Video";
                cd(save_gif)
                frame = getframe(gcf);
                writeVideo(v,frame);
                drawnow
                
            end

            save_gif = "D:/Matlab/Video";
            cd(save_gif)
            frame = getframe(gcf);
            writeVideo(v,frame);
            drawnow
        end
        
    end
    numVis = numVis +1;
end