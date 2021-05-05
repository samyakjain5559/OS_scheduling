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

struct node *dorr(struct node *newhead,struct node *thisnode){
    struct node *tempret = (struct node*)malloc(sizeof(struct node));
    tempret = thisnode;
    //char *namerr = thisnode->task->name;
    int idrr = thisnode->task->tid;
// increase to next temp if value not greater or equal
// for first time it will enter the temp->next
    struct node *temp = newhead;
    while(temp != NULL){
       if( temp->task->priority >= tempret->task->priority ){
           if(temp->task->tid != idrr){
               tempret = temp;
               temp = temp->next;
           }else{
             temp = temp->next;
           }
       }else{
           temp = temp->next;
       }
    }

    return tempret;
}

void schedule(){

     int waittime= 0;
     float avgwaittime= 0;
     float avgturnaroundtime= 0;
     int count = 0;
     int burstcarry[100];
     int carryinc = 0;
     int procccount =0;
     int n[100];
     int i,j=0;
     int maxval = 0;
     for(i=0;i<100;i++){
        n[i] = 0;
     }
     struct node *nodehelp = newhead;
     while(nodehelp != NULL){
        burstcarry[carryinc] = nodehelp->task->burst;
        //printf("carryin = %d\n",burstcarry[carryinc]);
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
        //while (nextnode->next != NULL) { // get last node
           //nextnode = nextnode->next;
        //}
            if(nextnode->task->burst > 2){
               //nextnode = temp;
               waittime = waittime + 2;
               procccount = procccount +1;
               //n[count] = waittime;
               //count = count + 1;
               printf("Running task = [%s] [%d] [%d] for %d units.\n",nextnode->task->name, nextnode->task->priority, nextnode->task->burst, 2);
               nextnode->task->burst = (nextnode->task->burst)-2;
               temp = dorr(newhead,temp);
            }else{
               //nextnode = temp;
               waittime = waittime + nextnode->task->burst;
               //int inc = 0;
               //for(inc = 0;inc < (count-1);inc++){
                    //nodehelp = nodehelp->next;
               //}
               //printf("waitime = %d\n",waittime);
               //printf("countval = %d\n",count);
               //printf("procccount = %d\n",procccount);
               if(procccount > 0){
                 n[count] = waittime-(procccount*2)-nextnode->task->burst;
               }else{
                 n[count] = waittime-nextnode->task->burst;
               }

               //printf("ncount = %d\n",n[count]);
               count = count + 1;
               procccount = procccount +1;
               printf("Running task = [%s] [%d] [%d] for %d units.\n",nextnode->task->name, nextnode->task->priority, nextnode->task->burst, nextnode->task->burst);
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
            }

                if(temp != NULL){
                   //temp = temp->next;
                   nextnode = temp;
                }
                //else{
                   //temp = newhead;  // reset
                   //nextnode = temp;
                //}
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

        printf("Average response time = %0.2f\n",out1);

}
