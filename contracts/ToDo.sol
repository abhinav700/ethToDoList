pragma solidity >=0.8.0;
//SPDX-License-Identifier:UNLICESNED



// there is  a limit on the size of smart contract, because of which 
// they are not very long. size limit is basically about 24 kilobytes.


//we avoid to put too much complexity in our smart contract, because it is immutable once deployed.
contract ToDo{
     struct Task{
         uint id;
         uint date;
         string content;
         string author;
         bool done;
         uint dateComplete;
     }


      mapping(uint=>Task) public tasks;
      uint public nextTaskId;


      event TaskCreated(
          uint id,
          uint date,
          string content,
          string author,
          bool done
      );

     
      event TaskStatusToggled(
          uint id,
          bool done,
          uint date  );
         


      function createTask(string memory _content,string memory _author) external{
            tasks[nextTaskId]=  Task(nextTaskId,block.timestamp,_content,_author,false,0);
            emit TaskCreated(nextTaskId,block.timestamp,_content,_author,false);
            nextTaskId++;
        }


      
      function getTasks()  external view returns(Task[] memory){
          
          //we are declaring a local variable _tasks
          Task[] memory _tasks=new Task[] (nextTaskId);
          for(uint i=0;i<nextTaskId;i++){
              _tasks[i]=tasks[i];
          }
          return _tasks;
      }


      function toggleDone(uint id) external{
          require(tasks[id].id != 0,'task does not exist');     //we will face problem with first task with this logic, but we will correct it later.
          Task storage task=tasks[id];  //extract a task from mapping;
          task.done=!task.done;
          task.dateComplete=task.done?block.timestamp:0;
          emit TaskStatusToggled(id,task.done,task.dateComplete);
      }



}