
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: const WaterDropHeader(),
      child: ListView.builder(
        itemCount: msgList.length,
        itemBuilder: (context, index) {
          return ChatCardWidget(
            messageList: msgList[index],
          );
        },
      ),
    );
  }
}