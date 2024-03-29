# include "task.h"
# include "list.h"
# include "cpu.h"
# include "schedulers.h"
# include <string.h>

struct node *newhead;
int addnum =0;

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
insert(&newhead,fortask);
}

void schedule(){
  int waittime= 0;
  float avgwaittime= 0;
  float avgturnaroundtime= 0;
  int count = 0;
  int n[100];
  int i,j=0;
  for(i=0;i<100;i++){
    n[i] = 0;
  }
  int x =0;
  for(x = 0;x < addnum; x++){  // inverting the Linked list
        struct node *temp;  // code taken from list.c
        temp = newhead;
        while (temp->next != NULL && (temp->next->task->tid >= 0)) {
            //printf("[%s] [%d] [%d]\n",temp->task->name, temp->task->priority, temp->task->burst);
            temp = temp->next;
        }
        temp->task->tid = -1;
        waittime = waittime + temp->task->burst;
        n[count] = waittime;
        count = count + 1;
        printf("Running task = [%s] [%d] [%d] for %d units.\n",temp->task->name, temp->task->priority, temp->task->burst, temp->task->burst);
        //delete(&newhead,temp->task);
  }
        for(j=0;j<(count-1);j++){
           avgwaittime = avgwaittime + n[j];
           //printf("wait times = %d\n",n[j]);
           //printf("Average waiting time = %d\n",avgwaittime);
        }
        float out1 = (avgwaittime/count);
        printf("\nAverage waiting time = %0.2f\n",out1);

        for(j=0;j<(count);j++){
           avgturnaroundtime = avgturnaroundtime + n[j];
           //printf("wait times = %d\n",n[j]);
           //printf("Average waiting time = %d\n",avgwaittime);
        }
        float out2 = (avgturnaroundtime/count);
        printf("Average turnaround time = %0.2f\n",out2);

        printf("Average response time = %0.2f\n",out1);

}
