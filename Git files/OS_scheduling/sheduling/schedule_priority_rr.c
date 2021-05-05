# include "task.h"
# include "list.h"
# include "cpu.h"
# include "schedulers.h"
# include <string.h>

struct node *newhead;
int addnum =0;

void insertmy(struct node **head, Task *newTask){     // insert at last of linked list code taken from EECS 2011 winter 2019
    struct node *newNode = (struct node*)malloc(sizeof(struct node));  // adding at the end of the linked list
    newNode->task = newTask;
    struct node *end;
    end = *head;
    if(*head == NULL){
       *head = newNode;
    }else{
        while(end->next != NULL){
           end = end->next;
        }
        end->next = newNode;
        newNode->next = NULL;
    }
}

int right(int id, int right_priority){

      struct node *rightt = newhead;
      while(rightt != NULL){
         if(right_priority == rightt->task->priority){
            if(rightt->task->tid > id){
                return 1;
            }
         }
         rightt = rightt->next;
      }
      return 0;
}

void add(char *name,int priority,int burst){
Task *fortask = (Task*) malloc(sizeof(Task));
fortask->burst = (int) malloc(sizeof(int));
fortask->burst = burst;
fortask->priority = (int) malloc(sizeof(int));
fortask->priority = priority;
fortask->tid = addnum;
addnum = addnum + 1;
int length = (strlen(name)+1);
fortask->name = malloc(sizeof(char)*(length));
strcpy(fortask->name,name);
insertmy(&newhead,fortask);

}

int check(int cpri , int cid){
     struct node *checkit = newhead;
     while(checkit != NULL){
         if((checkit->task->priority == cpri) && (checkit->task->tid != cid)){
             return 1;
         }
         checkit= checkit->next;
     }
     return 0;
}

void schedule(){
     int savep , saveid = 0;
     int waittime= 0;
     float avgwaittime= 0;
     float avgturnaroundtime= 0;
     float avgresponsetime = 0;
     int count = 0;
     int burstcarry[100];
     int carryinc = 0;
     int procccount =0;
     int n[100];
     int responsecount[100];
     int rescount = 0;
     int i,j=0;
     int maxval = 0;
     for(i=0;i<100;i++){
        n[i] = 0;
     }
     struct node *nodehelp = newhead;
     while(nodehelp != NULL){
        burstcarry[carryinc] = nodehelp->task->burst;
        //printf("carryin = %d %s\n",nodehelp->task->tid,nodehelp->task->name);
        carryinc = carryinc + 1;
        nodehelp = nodehelp->next;
     }

     struct node *temp;  // code taken from list.c
     struct node *maxprior = newhead;
     int maxpriorval = 0;
     while(maxprior != NULL){
         if(maxprior->task->priority > maxpriorval){
             temp = maxprior;
             maxpriorval = maxprior->task->priority;
         }
         maxprior= maxprior->next;
     }
     //temp = newhead;

     while(newhead != NULL){  // inverting the Linked list


        struct node *nextnode;
        nextnode = temp;
            //printf("check val %d",check(nextnode->task->priority));
            if(check(nextnode->task->priority,nextnode->task->tid) == 0){ // no same priority
               if(nextnode->task->tidprr != -1){
                  nextnode->task->tidprr = -1;
                  responsecount[rescount] = waittime;
                  rescount = rescount + 1;
               }
               waittime = waittime + nextnode->task->burst;
               //procccount = procccount +1;
               n[count] = waittime-nextnode->task->burst;
               count = count + 1;
               printf("Running task = [%s] [%d] [%d] for %d units.\n",nextnode->task->name, nextnode->task->priority, nextnode->task->burst, nextnode->task->burst);
               //nextnode->task->burst = (nextnode->task->burst)-nextnode->task->burst;
               nextnode->task->burst = 0;
               if(nextnode->task->burst <= 0){
                   delete(&newhead,nextnode->task);
                   procccount = 0;
               }
               struct node *maxprior1 = newhead; // set temp
               int maxpriorval1 = 0;
               while(maxprior1 != NULL){
                   if(maxprior1->task->priority > maxpriorval1){
                        temp = maxprior1;
                        maxpriorval1 = maxprior1->task->priority;
                   }
                     maxprior1= maxprior1->next;
               }
            }else if(nextnode->task->burst > 10){
               //printf("------temps--------\n");
               //traverse(newhead);
               //printf("------tempe--------\n");
               //nextnode = temp;
               if(nextnode->task->tidprr != -1){
                  nextnode->task->tidprr = -1;
                  responsecount[rescount] = waittime;
                  rescount = rescount + 1;
               }
               waittime = waittime + 10;
               procccount = procccount +1;
               //n[count] = waittime;
               //count = count + 1;
               printf("Running task = [%s] [%d] [%d] for %d units.\n",nextnode->task->name, nextnode->task->priority, nextnode->task->burst, 10);
               nextnode->task->burst = (nextnode->task->burst)-10;
               //temp = dorr(newhead,temp);
               int idrr = temp->task->tid;
                struct node *temperory = newhead;
                while(temperory != NULL){
                   if( temperory->task->priority >= temp->task->priority ){  // able to do rr but cant check if input was first and after 3rd same priority
                       //printf("camparing temperory and temp val %s %s \n",temperory->task->name,temp->task->name);
                       if(temperory->task->tid > idrr){
                           temp = temperory;
                           //printf("temp val2 %s %d %d \n",temp->task->name,temp->task->priority,temp->task->burst);
                           break;
                           //temperory = temperory->next;

                       }else if((temperory->task->tid != idrr) && (right(idrr,temp->task->priority) == 0)){
                            temp = temperory;
                            //printf("temp val %s %d %d \n",temp->task->name,temp->task->priority,temp->task->burst);
                            break;
                       }else{
                         temperory = temperory->next;
                       }
                   }else{
                       temperory = temperory->next;
                   }
                }
            }else{
               //nextnode = temp;
               if(nextnode->task->tidprr != -1){
                  nextnode->task->tidprr = -1;
                  responsecount[rescount] = waittime;
                  rescount = rescount + 1;
               }
               waittime = waittime + nextnode->task->burst;
               //int inc = 0;
               //for(inc = 0;inc < (count-1);inc++){
                    //nodehelp = nodehelp->next;
               //}
               //printf("waitime = %d\n",waittime);
               //printf("countval = %d\n",count);
               //printf("procccount = %d\n",procccount);
               if(procccount > 0){
                 n[count] = waittime-(procccount*10)-nextnode->task->burst;
               }else{
                 n[count] = waittime-nextnode->task->burst;
               }

               //printf("ncount = %d\n",n[count]);
               count = count + 1;
               procccount = procccount +1;
               printf("Running task = [%s] [%d] [%d] for %d units.\n",nextnode->task->name, nextnode->task->priority, nextnode->task->burst, nextnode->task->burst);
               nextnode->task->burst = 0;

               if(nextnode->task->burst <= 0){
                   saveid = nextnode->task->tid;
                   savep = nextnode->task->priority;
                   delete(&newhead,nextnode->task);
                   procccount = 0;
               }
               if((right(saveid,savep) == 1)){
                      struct node *rightt = newhead;
                      while(rightt != NULL){
                         if(savep == rightt->task->priority){
                            if(rightt->task->tid > saveid){
                                temp = rightt;
                                break;
                            }
                         }
                         rightt = rightt->next;
                      }
               }else{
                   struct node *maxprior1 = newhead; // set temp
                   int maxpriorval1 = 0;
                   while(maxprior1 != NULL){
                       if(maxprior1->task->priority > maxpriorval1){
                            temp = maxprior1;
                            maxpriorval1 = maxprior1->task->priority;
                       }
                         maxprior1= maxprior1->next;
                   }
               }

            }

                if(temp != NULL){
                   nextnode = temp;
                }
     }

        for(j=0;j<(count);j++){
           avgwaittime = avgwaittime + n[j];
           //printf("wait times = %d\n",n[j]);
           //printf("Average waiting time = %d\n",avgwaittime);
        }
        //printf("Average waiting time = %0.2f\n",avgwaittime);
        //printf("count = %d\n",count);
        float out1 = (avgwaittime/count);
        printf("\nAverage waiting time = %0.2f\n",out1);

        for(j=0;j<(count);j++){
           avgturnaroundtime = avgturnaroundtime + n[j]+burstcarry[j];
           //printf("wait times = %d\n",n[j]);
           //printf("Average waiting time = %d\n",avgwaittime);
        }
        float out2 = (avgturnaroundtime/count);
        printf("Average turnaround time = %0.2f\n",out2);

        for(j=0;j<(rescount);j++){
           avgresponsetime = avgresponsetime + responsecount[j];
           //printf("tihis responset time = %d\n",responsecount[j]);
           //printf("Average waiting time = %d\n",avgwaittime);
        }
        float out3 = (avgresponsetime/count);
        printf("Average response time = %0.2f\n",out3);

}
