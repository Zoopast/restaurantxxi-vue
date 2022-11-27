import { ref, onBeforeUnmount } from "vue";

function formatTimeInMinutes(time){
  return time / 60;
}

export const useCurrentTime = (created_time) => {
  const currentTime = ref(new Date().getTime());
  const created_at = new Date(created_time).getTime();
  const updateCurrentTime = () => {
    currentTime.value = formatTimeInMinutes(Math.round((new Date().getTime() - created_at) / 1000));
  };
  const updateTimeInterval = setInterval(updateCurrentTime, 1000);
  onBeforeUnmount(() => {
    clearInterval(updateTimeInterval);
  });
  return {
    currentTime,
  };
};