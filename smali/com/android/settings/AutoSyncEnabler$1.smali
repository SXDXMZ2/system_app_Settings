.class Lcom/android/settings/AutoSyncEnabler$1;
.super Landroid/content/BroadcastReceiver;
.source "AutoSyncEnabler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/AutoSyncEnabler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/AutoSyncEnabler;


# direct methods
.method constructor <init>(Lcom/android/settings/AutoSyncEnabler;)V
    .locals 0

    .prologue
    .line 108
    iput-object p1, p0, Lcom/android/settings/AutoSyncEnabler$1;->this$0:Lcom/android/settings/AutoSyncEnabler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/android/settings/AutoSyncEnabler$1;->this$0:Lcom/android/settings/AutoSyncEnabler;

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v1

    # invokes: Lcom/android/settings/AutoSyncEnabler;->setChecked(Z)V
    invoke-static {v0, v1}, Lcom/android/settings/AutoSyncEnabler;->access$000(Lcom/android/settings/AutoSyncEnabler;Z)V

    .line 112
    return-void
.end method
