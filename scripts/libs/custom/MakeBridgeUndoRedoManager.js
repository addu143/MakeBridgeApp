var MakeBridgeUndoRedoManager = function () {
    
    var index = 0;
    var myStack = new Array();

    this.registerAction = MakeBridgeUndoRedoManager_RegisterAction;
    this.undo = MakeBridgeUndoRedoManager_Undo;
    this.redo = MakeBridgeUndoRedoManager_Redu;
    
    function MakeBridgeUndoRedoManager_RegisterAction(recHtml) { // Save HTML before performing any action
        console.log("UNDO/REDO LOG: REGISTER ACTION WITH HTML:" + recHtml);
        myStack[index] = recHtml;
        index++;
    }

    function MakeBridgeUndoRedoManager_Undo(newHtml) { // On press undo return last time saved html and also save the current html at its place
        if (index > 0) {
            index--;
            console.log("UNDO/REDO LOG: UNDO ACTION WITH HTML:" + newHtml);
            var oldValue = myStack[index];
            myStack[index] = newHtml;
            return oldValue;
        }
        return "false";
    }

    function MakeBridgeUndoRedoManager_Redu() { // on Press Redu return current stack Element and increase index to save next action html
        if (index < myStack.length) {
            index++;
            console.log("UNDO/REDO LOG: REDO ACTION SENDING HTML:" + myStack[index-1]);
            return myStack[index-1];
        }
        return "false";
    }

}