function VOGA__ProcessRawData
    %Make Notes Files, edit notes files and edit VOG trigger if needed
    Raw_Path = [cd,filesep,'Raw Files'];
    %% Move Files into a Workable State
    %Transfer NKI Raw Files from their subfolders if they exist
    moveNKIfiles(Raw_Path)
    %Split and move GNO files into Raw Files
    moveGNOfiles(cd)
    %Ppen PDF for notes, close manually later
    pdf_files = extractfield(dir([cd,filesep,'*.pdf']),'name');
    for i = 1:length(pdf_files)
        open(pdf_files{i})
    end  
    %% Create Notes Files
    %Detect and process log files (eeVOR)
    logtoNotes(Raw_Path)
    %Make notes files in other ways
    MakeNotes(Raw_Path)
end