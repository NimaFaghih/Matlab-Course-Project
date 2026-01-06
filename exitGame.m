function exitGame(~, ~)

    f = gcbf;
    if ~isempty(f) && ishandle(f)
        close(f);
    end
end